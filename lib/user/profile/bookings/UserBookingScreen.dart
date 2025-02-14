import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Add this import
import 'BookingConfirmationScreen.dart';

class UserBookingScreen extends StatefulWidget {
  final String vendorId;

  const UserBookingScreen({super.key, required this.vendorId});

  @override
  State<UserBookingScreen> createState() => _UserBookingScreenState();
}

class _UserBookingScreenState extends State<UserBookingScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 237, 255, 246),
          title: Text("Payment Successful"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
    await _submitBooking(); // Proceed with booking after successful payment
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Failed: ${response.message}")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text("External Wallet Selected: ${response.walletName}")),
    );
  }

  void _openRazorpayCheckout() {
    var options = {
      'key': 'rzp_test_a66YOERQYDJCVb', // Replace with your Razorpay API key
      'amount': 100 * 100, // Amount in paise (e.g., 100 INR = 10000 paise)
      'name': 'Booking Payment',
      'description': 'Payment for booking service',
      'prefill': {
        'contact': phoneController.text,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _submitBooking() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You need to be logged in to book.")),
      );
      return;
    }

    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        _startDate == null ||
        _endDate == null ||
        addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields.")),
      );
      return;
    }

    try {
      String formattedStartDate =
          "${_startDate!.year}-${_startDate!.month.toString().padLeft(2, '0')}-${_startDate!.day.toString().padLeft(2, '0')}";
      String formattedEndDate =
          "${_endDate!.year}-${_endDate!.month.toString().padLeft(2, '0')}-${_endDate!.day.toString().padLeft(2, '0')}";

      DocumentReference bookingRef =
          await FirebaseFirestore.instance.collection("bookings").add({
        "vendorId": widget.vendorId,
        "userId": userId,
        "name": nameController.text,
        "phone": phoneController.text,
        "startDate": formattedStartDate,
        "endDate": formattedEndDate,
        "address": addressController.text,
        "timestamp": FieldValue.serverTimestamp(),
      });

      String bookingId = bookingRef.id;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Booking saved successfully!")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BookingConfirmationScreen(
            vendorId: widget.vendorId,
            bookingId: bookingId,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving booking: $e")),
      );
    }
  }

  Widget buildDateButton({required String label, required bool isStartDate}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      onPressed: () => _selectDate(context, isStartDate),
      child: Text(
        isStartDate
            ? (_startDate != null
                ? "${_startDate!.toLocal()}".split(' ')[0]
                : label)
            : (_endDate != null
                ? "${_endDate!.toLocal()}".split(' ')[0]
                : label),
        style: TextStyle(fontSize: 16, color: Colors.teal[700]),
      ),
    );
  }

  Widget buildTextField(
      {required String label,
      required TextEditingController controller,
      int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 18, color: Colors.teal[800])),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLines == 3 ? 150 : null,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 2, 122, 108)),
                borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 101, 255, 181)),
                borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(
            "Book a Service",
            style: TextStyle(color: Colors.teal[800]),
          )),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            buildTextField(label: "Name", controller: nameController),
            SizedBox(height: 15.h),
            buildTextField(label: "Phone", controller: phoneController),
            SizedBox(height: 15.h),
            Text("Select Date",
                style: TextStyle(fontSize: 18, color: Colors.teal[800])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDateButton(label: "Start Date", isStartDate: true),
                buildDateButton(label: "End Date", isStartDate: false),
              ],
            ),
            SizedBox(height: 30.h),
            buildTextField(
                label: "Address", controller: addressController, maxLines: 3),
            SizedBox(height: 30.h),
            // Slide-to-Confirm using flutter_slidable
            Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                motion: const DrawerMotion(),
                dismissible: DismissiblePane(onDismissed: () {
                  _openRazorpayCheckout(); // Trigger payment when dismissed
                }),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      _openRazorpayCheckout(); // Trigger payment when action is pressed
                    },
                    backgroundColor: const Color.fromARGB(255, 90, 198, 151),
                    foregroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    label: 'Pay',
                  ),
                ],
              ),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Swipe to Confirm Payment",
                    style: TextStyle(
                      color: Colors.teal[800],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
