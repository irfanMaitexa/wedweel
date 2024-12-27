import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';

class Venue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Vendormaininuser(
        vendorname: "Grand Hall",
        location: "idiyangara,Calicut",
        price: "90000",
        vendorimage: hall1,
        guestcount: '1000',
        isVenueVendor: true,
      ),
    ));
  }
}
