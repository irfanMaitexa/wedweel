import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';

class Decorationvendor extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Vendormaininuser(
          vendorname: 'Dk Decoration',
          location: 'Kochi',
          price: '20000',
          vendorimage: decoration1,
          isVenueVendor: false),
    ));
  }
}