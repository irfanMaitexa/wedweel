import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedweel/AddCloudinaryImage.dart';

class AddServiceVendor extends StatefulWidget {
  AddServiceVendor({Key? key}) : super(key: key);

  @override
  _AddServiceVendorState createState() => _AddServiceVendorState();
}

class _AddServiceVendorState extends State<AddServiceVendor> {
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController servicePriceController = TextEditingController();
  final TextEditingController serviceDescriptionController =
      TextEditingController();

  File? image;
  String? selectedCategory; // State variable for the selected category
  final List<String> categories = [
    'vendor',
    'venue',
    'photo',
    'makeup',
    'flower',
    'decoration',
    'food',
    'cake'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Service",
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
              // Dropdown for selecting category
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    dropdownColor: const Color.fromARGB(255, 250, 255, 249),
                    borderRadius: BorderRadius.circular(10),
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    items: categories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.teal, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Select a category",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          controller: serviceNameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 1),
                            ),
                            hintText: "location",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () async {
                        image = await pickImage();
                        setState(
                            () {}); // Refresh the UI to show the selected image
                      },
                      child: image != null
                          ? Image.file(
                              image!,
                              height: 100,
                              width: 100,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'asset/upload.jpeg',
                                height: 100,
                                width: 100,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Service Price",
                    style:
                        TextStyle(fontSize: 17, fontFamily: 'Poppins-Regular'),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: servicePriceController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.teal, width: 1),
                      ),
                      hintText: "2000",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Service Description",
                      style: TextStyle(
                          fontSize: 17, fontFamily: 'Poppins-Regular')),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: serviceDescriptionController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.teal, width: 1),
                      ),
                      hintText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 46,
              ),
              ElevatedButton(
                onPressed: () async {
                  await addServiceToFirebase(context);
                },
                child: Text(
                  "Add Service",
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
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    return pickedImage != null ? File(pickedImage.path) : null;
  }

  Future<void> addServiceToFirebase(BuildContext context) async {
    if (serviceNameController.text.isEmpty ||
        servicePriceController.text.isEmpty ||
        serviceDescriptionController.text.isEmpty ||
        image == null ||
        selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Please fill all fields, select an image, and choose a category.")),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      // Initialize Cloudinary
      final cloudinaryUrl = await uploadImageToCloudinary(image!);

      // Save data to Firestore
      await FirebaseFirestore.instance.collection('services').add({
        'location': serviceNameController.text,
        'price': servicePriceController.text,
        'description': serviceDescriptionController.text,
        'image': cloudinaryUrl,
        'category': selectedCategory, // Add the selected category
        'vendor_id': FirebaseAuth.instance.currentUser?.uid,
      });

      Navigator.pop(context); // Close the loading dialog
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Your service has been added successfully.'),
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
      Navigator.pop(context); // Close the loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
}
