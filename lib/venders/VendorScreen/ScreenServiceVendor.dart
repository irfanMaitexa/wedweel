import 'package:flutter/material.dart';

class Screenservicevendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Vendor Screen",
          style: TextStyle(
            fontSize: 23,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 21, 101, 93),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'asset/UploadPhoto.jpeg',
                      fit: BoxFit.fitHeight,
                      height: 175,
                      width: 400,
                    ),
                  ),
                  Container(
                      child: Text(
                    " Upload Image",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 21),
                  )),
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'asset/se.jpeg',
                      fit: BoxFit.fitHeight,
                      height: 175,
                      width: 400,
                    ),
                  ),
                  Container(
                      child: Text(
                    " Add Service",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 21),
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'asset/Booking.jpeg',
                      fit: BoxFit.fitHeight,
                      height: 175,
                      width: 400,
                    ),
                  ),
                  Container(
                      child: Text(
                    " Bookings ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 21),
                  )),
                ],
              ),
            ),
          ]),
        )
      ]),
    );
  }
}
