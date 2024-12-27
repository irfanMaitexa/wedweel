import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';

class Cateryingvendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Vendormaininuser(
            vendorname: 'Royal Catering',
            location: 'Kochi',
            price: '200000',
            vendorimage: catering1,
            isVenueVendor: false),
      ),
    );
  }
}
