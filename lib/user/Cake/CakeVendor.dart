import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/Cake/CakeDetails.dart';
import 'package:wedweel/user/VendorMainINUser.dart';

class Cakevendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cakedetails()),
            );
          },
          child: Vendormaininuser(
              vendorname: 'Cake World',
              location: 'Calicut',
              price: '2000',
              vendorimage: cakeshop1,
              isVenueVendor: false),
        ),
      ),
    );
  }
}
