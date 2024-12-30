import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/Decoration/DecorationDeatils.dart';
import 'package:wedweel/user/VendorMainINUser.dart';

class Decorationvendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Decorationdeatils()),
          );
        },
        child: Vendormaininuser(
            vendorname: 'Dk Decoration',
            location: 'Kochi',
            price: '20000',
            vendorimage: decoration1,
            isVenueVendor: false),
      ),
    ));
  }
}
