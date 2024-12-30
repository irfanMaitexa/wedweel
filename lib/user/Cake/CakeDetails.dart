import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/VendorMainDetails.dart';

class Cakedetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(
            "Cake World",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: Vendormaindetails(
            vendorname: 'Cake World',
            isVenueVendor: false,
            location: 'Calicut',
            vendorimage: cakeshop2,
            price: '2000',
            vendordescription:
                'Welcome to Cake World, your ultimate destination for delectable and beautifully crafted cakes in Calicut. Our skilled bakers and decorators are passionate about creating cakes that not only taste amazing but also look stunning. Whether it\'s a wedding, birthday, anniversary, or any special occasion, we offer a wide variety of flavors and designs to suit your needs. At Cake World, we use only the finest ingredients to ensure the highest quality in every bite. Let us make your celebrations sweeter with our exquisite cakes and exceptional service.'),
      ),
    );
  }
}
