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
                'Welcome to DK Decoration, your premier choice for transforming any event into a breathtaking experience. Based in Kochi, our talented team specializes in creating stunning and unique decorations for weddings, corporate events, and personal celebrations. We use a blend of creativity and attention to detail to craft beautiful settings that reflect your style and vision. From elegant floral arrangements to intricate lighting designs, DK Decoration ensures that every aspect of your event is picture-perfect. Let us bring your dream event to life with our exceptional decoration services.'),
      ),
    );
  }
}
