import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/UserHome/ViewAllVendors.dart';

class Vendorlist extends StatelessWidget {

  @override
  Widget toplistVendor({
    required String topvendorname,
    required String topvendorimage,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20, right: 20),
      child: Container(
        height: 210,
        width: 290,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  topvendorimage,
                  fit: BoxFit.cover,
                  height: 170,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            topvendorname,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Medium',
                              height: 3,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(
                                255,
                                21,
                                101,
                                93,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                            leading: Icon(
                              Icons.star_border_outlined,
                              color: Colors.amber,
                            ),
                            title: Row(
                              children: [
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: const Color.fromARGB(
                                          255, 97, 97, 97)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "(200)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: const Color.fromARGB(
                                          255, 97, 97, 97)),
                                ),
                              ],
                            ),
                            trailing: Icon(Icons.favorite_border_outlined)),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget listVendor({
    required String vendorname,
    required String vendorimage,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      child: Container(
        height: 270,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  vendorimage,
                  fit: BoxFit.cover,
                  height: 170,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            vendorname,
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(
                                255,
                                21,
                                101,
                                93,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          title: Row(
                            children: [
                              Text(
                                "4.5",
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        const Color.fromARGB(255, 97, 97, 97)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "(200)",
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        const Color.fromARGB(255, 97, 97, 97)),
                              ),
                            ],
                          ),
                          trailing: Icon(Icons.favorite_border_outlined),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: Padding(
          padding: EdgeInsets.only(left: 17, right: 17, top: 17),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Top Vendors",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 21, 101, 93),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    toplistVendor(
                      topvendorimage: hall1,
                      topvendorname: "Grand Auditorium",
                    ),
                    toplistVendor(
                      topvendorimage: makeup1,
                      topvendorname: "Wave Saloon",
                    ),
                    toplistVendor(
                      topvendorimage: photography1,
                      topvendorname: "Photoland",
                    ),
                    toplistVendor(
                        topvendorname: "Cake Studio",
                        topvendorimage: cakeshop1),
                    toplistVendor(
                        topvendorname: "City Blooms",
                        topvendorimage: flowershop1),
                    toplistVendor(
                        topvendorname: "Royal Catering",
                        topvendorimage: catering1),
                    toplistVendor(
                        topvendorname: "Dk decoration",
                        topvendorimage: decoration1)
                  ],
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
              ListTile(
                leading: Text(
                  "vendors",
                  style: TextStyle(fontFamily: 'Poppins-Regular', fontSize: 17),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewAllVendors(),
                      ),
                    );
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 15,
                        color: Colors.blue),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      listVendor(
                        vendorimage: cakeshop2,
                        vendorname: "Biscotte",
                      ),
                      listVendor(
                        vendorimage: makeup2,
                        vendorname: "Seli beauty Lounge",
                      ),
                      listVendor(
                        vendorimage: photography2,
                        vendorname: "Life Style Photography",
                      ),
                      listVendor(
                          vendorname: "Honey Cakes", vendorimage: cakeshop2),
                      listVendor(
                          vendorname: "flower shop", vendorimage: flowershop2),
                      listVendor(
                          vendorname: "Eva Mose Catering",
                          vendorimage: catering2),
                      listVendor(
                          vendorname: "Splash Event", vendorimage: decoration2),
                      listVendor(
                        vendorimage: hall1,
                        vendorname: "Grand Auditorium",
                      ),
                      listVendor(
                        vendorimage: makeup1,
                        vendorname: "Wavesaloon",
                      ),
                      listVendor(
                        vendorimage: photography1,
                        vendorname: "Photoland",
                      ),
                      listVendor(
                          vendorname: "Cake Studio", vendorimage: cakeshop1),
                      listVendor(
                          vendorname: "City Blooms", vendorimage: flowershop1),
                      listVendor(
                          vendorname: "Royal Catering", vendorimage: catering1),
                      listVendor(
                          vendorname: "Dk decoration", vendorimage: decoration1)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
