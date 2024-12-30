import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainDetails.dart';

class Cateryingdetails extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
       appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(
            "Royal Catering",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
        ),
      body: Vendormaindetails(vendorname: 'Royal Catering', isVenueVendor: false, location: 'Kochi', vendorimage: catering2, price: '200000', vendordescription:'Welcome to Royal Catering, where culinary excellence meets exceptional service. Based in Kochi, our team of professional chefs and staff are dedicated to providing a memorable dining experience for your events. From weddings and corporate gatherings to intimate celebrations, we offer a diverse menu featuring gourmet dishes made from the freshest ingredients. Our commitment to quality and attention to detail ensures that every meal is a feast for the senses. Let Royal Catering elevate your event with our exquisite cuisine and impeccable service.' ),
    ),);
  }
}