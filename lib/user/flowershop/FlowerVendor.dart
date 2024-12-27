import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';

class Flowervendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Vendormaininuser(
            vendorname: "Let Flowers",
            location: "Calicut",
            price: '5000',
            isVenueVendor: false,
            vendorimage: flowershop2),
      ),
    );
  }
}
