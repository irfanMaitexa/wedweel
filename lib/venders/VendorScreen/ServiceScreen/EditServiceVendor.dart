import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditServiceVendor extends StatefulWidget {
  final String serviceId; // Service ID to identify the document in Firestore

  EditServiceVendor({Key? key, required this.serviceId}) : super(key: key);

  @override
  _EditServiceVendorState createState() => _EditServiceVendorState();
}

class _EditServiceVendorState extends State<EditServiceVendor> {
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController servicePriceController = TextEditingController();
  final TextEditingController serviceDescriptionController =
      TextEditingController();

  File? image;
  bool isLoading = true; // For loading spinner
  String? currentVendorId;

  @override
  void initState() {
    super.initState();
    currentVendorId =
        FirebaseAuth.instance.currentUser?.uid; // Current vendor's ID
    fetchServiceData();
  }

  Future<void> fetchServiceData() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('services')
          .doc(widget.serviceId)
          .get();

      if (docSnapshot.exists &&
          docSnapshot.data()?['vendor_id'] == currentVendorId) {
        final data = docSnapshot.data()!;
        serviceNameController.text = data['location'] ?? '';
        servicePriceController.text = data['price'] ?? '';
        serviceDescriptionController.text = data['description'] ?? '';
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Service not found or access denied.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching service: $e")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> updateService() async {
    if (serviceNameController.text.isEmpty ||
        servicePriceController.text.isEmpty ||
        serviceDescriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields.")),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      final dataToUpdate = {
        'location': serviceNameController.text,
        'price': servicePriceController.text,
        'description': serviceDescriptionController.text,
      };

      await FirebaseFirestore.instance
          .collection('services')
          .doc(widget.serviceId)
          .update(dataToUpdate);

      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Your service has been updated successfully.'),
              actions: [
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } catch (e) {
      Navigator.pop(context); // Close loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error updating service: $e")),
      );
    }
  }

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    return pickedImage != null ? File(pickedImage.path) : null;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Service",
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 21, 101, 93),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "location",
                          style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 17,
                              color: Colors.black),
                        ),
                        SizedBox(height: 6),
                        TextFormField(
                          controller: serviceNameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 1),
                            ),
                            hintText: "Service Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        image = await pickImage();
                        setState(() {});
                      },
                      child: image != null
                          ? Image.file(image!, height: 100, width: 100)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'asset/upload.jpeg',
                                height: 100,
                                width: 100,
                              ),
                            ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Price",
                  style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 17,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 6),
              TextField(
                controller: servicePriceController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.teal, width: 1),
                  ),
                  hintText: "Service Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 17,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 6),
              TextField(
                controller: serviceDescriptionController,
                maxLines: 6,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.teal, width: 1),
                  ),
                  hintText: "Describe your service",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 46),
              ElevatedButton(
                onPressed: updateService,
                child: Text(
                  "Edit Service",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 50),
                  backgroundColor: Color.fromARGB(255, 237, 250, 244),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
