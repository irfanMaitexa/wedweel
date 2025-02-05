import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedweel/user/profile/bookings/BookingConfirmationScreen.dart';

class Userbookingscreen extends StatefulWidget {
  final String vendorId; // Accept vendor ID as a parameter

  const Userbookingscreen({super.key, required this.vendorId});

  @override
  State<Userbookingscreen> createState() => _UserbookingscreenState();
}

class _UserbookingscreenState extends State<Userbookingscreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
    // Get the currently logged-in user ID
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
      await FirebaseFirestore.instance.collection("bookings").add({
        "vendorId": widget.vendorId,
        "userId": userId,
        "name": nameController.text,
        "phone": phoneController.text,
        "startDate": _startDate!.toIso8601String(),
        "endDate": _endDate!.toIso8601String(),
        "address": addressController.text,
        "timestamp": FieldValue.serverTimestamp(), // For sorting
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Booking saved successfully!")),
      );

      // Clear Fields After Saving
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              BookingConfirmationScreen(vendorId: widget.vendorId),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving booking: $e")),
      );
    }
  }

  Widget button({required String name, required bool isStartDate}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 188, 248, 218),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: BorderSide(color: Colors.greenAccent),
        ),
      ),
      onPressed: () => _selectDate(context, isStartDate),
      child: Text(
        isStartDate
            ? _startDate != null
                ? "${_startDate!.toLocal()}".split(' ')[0]
                : name
            : _endDate != null
                ? "${_endDate!.toLocal()}".split(' ')[0]
                : name,
        style: TextStyle(fontSize: 16, color: Colors.teal[700]),
      ),
    );
  }

  Widget textField(
      {required String name, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 18, color: Colors.teal[800]),
        ),
        Container(
          height: 43.h,
          margin: EdgeInsets.only(top: 13),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 124, 255, 91),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 77, 182, 172),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          children: [
            SizedBox(height: 30.h),
            textField(name: "Name", controller: nameController),
            SizedBox(height: 15.h),
            textField(name: "Phone", controller: phoneController),
            SizedBox(height: 19.h),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text(
                "Select Date",
                style: TextStyle(fontSize: 18.sp, color: Colors.teal[800]),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(name: "Start Date", isStartDate: true),
                button(name: "End Date", isStartDate: false),
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              "Address",
              style: TextStyle(fontSize: 18.sp, color: Colors.teal[800]),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 30),
              child: TextFormField(
                controller: addressController,
                maxLines: 3,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.teal)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 116, 255, 94))),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 188, 248, 218),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                  side: BorderSide(color: Colors.greenAccent),
                ),
              ),
              onPressed: _submitBooking,
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 16, color: Colors.teal[700]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
