import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainDetails.dart';

class Venuedetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(
            "Grand Hall",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
        ),
        body: Vendormaindetails(
            isVenueVendor: true,
            vendorname: "Grand Hall",
            location: "idiyangara, Calicut",
            vendorimage: hall1,
            price: '90000',
            vendordescription:
                'Welcome to Grand Hall, the perfect venue for your special events in Calicut. Our spacious and elegant hall is ideal for weddings, receptions, corporate events, and other celebrations. With a capacity of 1000 guests, we can accommodate large gatherings and provide a comfortable and luxurious setting for your event. Our experienced staff will work with you to create a customized event that meets your needs and exceeds your expectations. Let Grand Hall be the backdrop for your unforgettable moments.'),
      ),
    );
  }
}
