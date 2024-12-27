import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainINUser.dart';

class Makeupvendor extends StatelessWidget {
  const Makeupvendor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Vendormaininuser(
          vendorname: "Seli's Beauty Lounge",
          location: "Calicut",
          price: '15000',
          isVenueVendor: false,
          vendorimage: makeup2),
    ));
  }
}
