import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';

class Photographyvendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Vendormaininuser(
          vendorname: "Photoland",
          location: "Calicut",
          price: '10000',
          isVenueVendor: false,
          vendorimage: photography3),
    ));
  }
}
