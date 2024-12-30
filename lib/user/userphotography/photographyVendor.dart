import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';
import 'package:wedweel/user/userphotography/photographyDetails.dart';

class Photographyvendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Photographydetails()),
          );
        },
        child: Vendormaininuser(
            vendorname: "Photoland",
            location: "Calicut",
            price: '10000',
            isVenueVendor: false,
            vendorimage: photography3),
      ),
    ));
  }
}
