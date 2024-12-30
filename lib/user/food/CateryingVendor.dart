import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';
import 'package:wedweel/user/food/CateryingDetails.dart';

class Cateryingvendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cateryingdetails()),
            );
          },
          child: Vendormaininuser(
              vendorname: 'Royal Catering',
              location: 'Kochi',
              price: '200000',
              vendorimage: catering1,
              isVenueVendor: false),
        ),
      ),
    );
  }
}
