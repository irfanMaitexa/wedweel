import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';
import 'package:wedweel/user/flowershop/FlowershopDetails.dart';

class Flowervendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Flowershopdetails()),
            );
          },
          child: Vendormaininuser(
              vendorname: "Let Flowers",
              location: "Calicut",
              price: '5000',
              isVenueVendor: false,
              vendorimage: flowershop2),
        ),
      ),
    );
  }
}
