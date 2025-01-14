import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/admin/screen/ManageBlogs.dart';
import 'package:wedweel/main.dart';
import 'package:wedweel/venders/VendorScreen/ReviewScreen/VendorReviewScreen.dart';

import 'package:wedweel/venders/VendorScreen/ServiceScreen/ServiceFirstScreenVendor.dart';
import 'package:wedweel/venders/VendorScreen/ProfileScreen/VendorProfile.dart';
import 'package:wedweel/venders/screen/BookingScreen/FirstScreenBooking.dart';

class VendorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      
       
        title: Text(
          "Vendor Home",
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 21, 101, 93),
          ),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: ClipOval(
                  child: Image.asset(
                    'asset/wedlogo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Column(
                children: [
                  Text("welcome,",
                      style: TextStyle(
                        fontSize: 27,
                        fontFamily: 'Poppins-Regular',
                        color: Color.fromARGB(255, 21, 101, 93),
                      )),
                  Text(
                    "  Wedcom Events",
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'poppins-Bold',
                        fontWeight: FontWeight.w900),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
            childAspectRatio: .9,
            padding: EdgeInsets.all(8),
            children: [
              Container(
                height: 90,
                width: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceFirstScreen()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(19),
                      child: Column(
                        children: [
                          Image.asset('asset/service.jpg'),
                          Text(" service")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 90,
                width: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstScreenBooking()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(19),
                      child: Column(
                        children: [
                          Image.asset('asset/Booking.jpeg'),
                          Text(" Bookings")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VendorReviewScreen()));
                },
                child: Container(
                  height: 90,
                  width: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset(
                            'asset/review.jpg',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 41,
                          ),
                          Text(" Review"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Manageblogs()));
                },
                child: Container(
                  height: 90,
                  width: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset('asset/blog.jpg'),
                          SizedBox(
                            height: 17,
                          ),
                          Text(" Blog")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Vendorprofile()));
                },
                splashColor: Colors.transparent,
                child: Container(
                  height: 90,
                  width: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset('asset/profile.jpg'),
                          Text(" Profile")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 90,
                width: 50,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset('asset/logout.jpg'),
                        Text("LogOut"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
