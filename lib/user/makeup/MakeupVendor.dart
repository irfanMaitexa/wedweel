import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';
import 'package:wedweel/user/makeup/MakeupDetails.dart';

class Makeupvendor extends StatelessWidget {
  const Makeupvendor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Makeupdetails()),
          );
        },
        child: Vendormaininuser(
            vendorname: "Seli's Beauty Lounge",
            location: "Calicut",
            price: '15000',
            isVenueVendor: false,
            vendorimage: makeup2),
      ),
    ));
  }
}
