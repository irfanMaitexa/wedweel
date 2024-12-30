import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainDetails.dart';

class Makeupdetails extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
       appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(
            "Seli's Beauty Lounge",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
        ),
      body: Vendormaindetails(
          isVenueVendor: false,
          vendorname: 'Seli\'s Beauty Lounge',
          location: 'Calicut',
          vendorimage: makeup2,
          price: '5000',
          vendordescription:
              'Welcome to Seli\'s Beauty Lounge, where we create stunning looks for every occasion. Our professional makeup artists use high-quality products and the latest techniques to enhance your natural beauty. Whether it\'s a wedding, a party, or a photoshoot, we offer personalized services to suit your unique style. Our team is dedicated to making you look and feel your best, ensuring you leave our salon with confidence and a smile. Conveniently located in Calicut, Seli\'s Beauty Lounge is your one-stop destination for all your makeup needs.'
    )));
  }
}