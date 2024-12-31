import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainDetails.dart';

class Decorationdeatils extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
         appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(
            "Dk Decoration",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
        ),
        body: Vendormaindetails(
            vendorname: 'Dk Decoration',
            isVenueVendor: false,
            location: 'Kochi',
            vendorimage: decoration2,
            price: '17000',
            vendordescription:
                'Transform your event with DK Decoration. Our expert team in Kochi creates stunning, personalized decorations for weddings, corporate events, and celebrations. From elegant floral arrangements to intricate lighting, we ensure every detail is perfect. Make your event unforgettable with DK Decoration.',),
      ),
    );
  }
}
