import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';

class Cakevendor extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Vendormaininuser(
            vendorname: 'Cake World',
            location: 'Calicut',
            price: '2000',
            vendorimage: cakeshop1,
            isVenueVendor: false),
      ),
    );
  }
}