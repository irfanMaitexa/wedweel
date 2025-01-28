import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainDetails.dart';

class Photographydetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
       appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(
            "Photoland",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
        ),
      body: Vendormaindetails(
          phonenumber: '1234567890',
          isVenueVendor: false,
          vendorname: 'Photoland',
          location: 'calicut',
          vendorimage: photography3,
          price: '10000',
          vendordescription:
              'Welcome to Photoland Studio, where we capture your precious moments with creativity and precision. Our experienced photographers use state-of-the-art equipment to ensure every shot is perfect. Whether it\'s a wedding, a corporate event, or a personal photoshoot, we provide personalized services to meet your unique needs. Located in the heart of Calicut, Photoland Studio is your go-to destination for professional photography services. Let us help you create lasting memories with our exceptional photography skills.'),
    ));
  }
}
