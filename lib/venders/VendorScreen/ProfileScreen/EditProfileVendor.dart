import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Editprofilevendor extends StatelessWidget {
  File? image;
  Widget editProfile(
      {String? labelname, String? hintname, IconData? iconprofile}) {
    return TextFormField(
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
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 21, 101, 93),
          ),
        ),
        backgroundColor: Colors.white,
      ),
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
                          image = await uploadImage();
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
                labelname: "Name",
                hintname: "Wedcom",
                iconprofile: Icons.person),
            SizedBox(
              height: 14,
            ),
            editProfile(
                labelname: "Email",
                hintname: "Wedcom@gmailcom",
                iconprofile: Icons.email_outlined),
            SizedBox(
              height: 14,
            ),
            editProfile(
                labelname: "Phone",
                hintname: "1234567890",
                iconprofile: Icons.phone_android_outlined),
            SizedBox(
              height: 14,
            ),
            editProfile(
                labelname: "Address",
                hintname: "Calicut",
                iconprofile: Icons.location_on_outlined),
            SizedBox(
              height: 41,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Edit Profile",
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
