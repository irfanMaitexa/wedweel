import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedweel/venders/vendorServics/VendorServics.dart';

class Signupsecondpage extends StatelessWidget {
  File? document, logo;

  final String fullname;
  final String email;
  final String password;

  Signupsecondpage(
      {required this.fullname, required this.email, required this.password});

      final TextEditingController address = TextEditingController();
      final TextEditingController phone =TextEditingController();

Widget editProfile(
      {String? labelname, String? hintname, IconData? iconprofile,required TextEditingController? controller}) {
    return TextFormField(
      controller:controller ,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(27),
              borderSide: BorderSide(color: Colors.teal, width: 1)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27),
          ),
          labelText: labelname,
          hintText: hintname,
          prefixIcon: Icon(
            iconprofile,
            color: Color.fromARGB(255, 21, 101, 93),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: Image.asset(
                        'asset/wedlogo.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 55,
                    right: 100,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.white),
                            )),
                        onPressed: () async {
                          logo = await uploadImage();
                        },
                        label: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                          size: 17,
                        )))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            editProfile(
                controller:phone,
                hintname: "1234567890",
                iconprofile: Icons.phone_android_outlined),
            SizedBox(
              height: 14,
            ),
            editProfile(
                controller: address,
                hintname: "Calicut",
                iconprofile: Icons.location_on_outlined),
            SizedBox(
              height: 14,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                document = await uploadImage();
              },
              label: Text(
                "Add Document",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              icon: Icon(Icons.document_scanner, color: Colors.black),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(310, 50),
                  backgroundColor: const Color.fromARGB(190, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color.fromARGB(255, 21, 101, 93)),
                      borderRadius: BorderRadius.circular(30))),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
              Vendorservics().SignUp(email: email, password: password, context: context, fullname: fullname, phone: phone.text, address: address.text, document: document!, logo: logo!,);
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(280, 50),
                  backgroundColor: Color.fromARGB(255, 208, 255, 233),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            )
          ],
        ),
      ),
    );
  }

  Future<File?> uploadImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    final imageFile = image != null ? File(image.path) : null;

    return imageFile;
  }
}
