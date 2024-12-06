import 'package:flutter/material.dart';

class UploadGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendor Screen"),
      ),
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: GridView.count(
              crossAxisCount: 1,
              shrinkWrap: true,
              mainAxisSpacing: 7,
              childAspectRatio: 1.6,
              padding: const EdgeInsets.all(6),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'asset/UploadImage.png',
                          fit: BoxFit.fitHeight,
                          height: 125,
                          width: 400,
                        ),
                      ),
                      Container(
                          child: Text(
                        " Upload Image",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'asset/se.jpeg',
                          fit: BoxFit.fitHeight,
                          height: 160,
                          width: 400,
                        ),
                      ),
                      Container(
                          child: Text(
                        " Add Service",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                      )),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'asset/Booking.jpeg',
                          fit: BoxFit.fitHeight,
                          height: 155,
                          width: 400,
                        ),
                      ),
                      Container(
                          child: Text(
                        " Bookings ",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
