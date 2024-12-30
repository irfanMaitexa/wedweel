import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';
import 'package:wedweel/user/Venue/VenueDetails.dart';

class Venue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Venuedetails()),
          );
        },
        child: Vendormaininuser(
          vendorname: "Grand Hall",
          location: "idiyangara,Calicut",
          price: "90000",
          vendorimage: hall1,
          guestcount: '1000',
          isVenueVendor: true,
        ),
      ),
    ));
  }
}
