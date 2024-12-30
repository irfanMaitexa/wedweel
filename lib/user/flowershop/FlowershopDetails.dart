import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainDetails.dart';

class Flowershopdetails extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
         appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(
            "Let Flowers",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
        ),
        body: Vendormaindetails(vendorname: 'Let Flowers', isVenueVendor: false, location: 'kochi', vendorimage: flowershop2, price: '1500', vendordescription:  'Welcome to Let Flowers, your premier destination for exquisite floral arrangements in Kochi. Our talented florists craft stunning bouquets and floral designs for every occasion, from weddings and corporate events to personal celebrations. Using only the freshest and most vibrant flowers, we ensure that each arrangement is a work of art. At Let Flowers, we are dedicated to providing exceptional service and creating beautiful, memorable experiences for our customers. Let us bring a touch of elegance and natural beauty to your special moments.'),
      ),
    );
  }
}