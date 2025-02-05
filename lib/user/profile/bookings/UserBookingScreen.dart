import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      // Format dates as "YYYY-MM-DD"
      String formattedStartDate =
          "${_startDate!.year}-${_startDate!.month.toString().padLeft(2, '0')}-${_startDate!.day.toString().padLeft(2, '0')}";
      String formattedEndDate =
          "${_endDate!.year}-${_endDate!.month.toString().padLeft(2, '0')}-${_endDate!.day.toString().padLeft(2, '0')}";

      // Save booking to Firestore
      DocumentReference bookingRef =
          await FirebaseFirestore.instance.collection("bookings").add({
        "vendorId": widget.vendorId,
        "userId": userId,
        "name": nameController.text,
        "phone": phoneController.text,
        "startDate": formattedStartDate, // Store date only
        "endDate": formattedEndDate, // Store date only
        "address": addressController.text,
        "timestamp": FieldValue.serverTimestamp(),
      });

      String bookingId = bookingRef.id; // Get the newly created booking ID

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Booking saved successfully!")),
      );

      // Navigate to Booking Confirmation Screen
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
          maxLength:
              maxLines == 3 ? 150 : null, // Limit character count for address
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
          title: Text("Book a Service")),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 159, 255, 208),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(7)),
              ),
              onPressed: _submitBooking,
              child: Text("Submit",
                  style: TextStyle(fontSize: 16, color: Colors.teal[800])),
            ),
          ],
        ),
      ),
    );
  }
}
