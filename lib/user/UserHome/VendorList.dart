import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wedweel/user/UserHome/ViewAllVendors.dart';

class Vendorlist extends StatelessWidget {
  const Vendorlist({super.key});

  @override
  Widget toplistVendor({
    required String topvendorname,
    required String topvendorimage,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20, right: 20),
      child: Container(
        height: 200,
        width: 300,
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
                  height: 160,
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
                        Text(
                          topvendorname,
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Poppins-Medium',
                            height: 4,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(
                              255,
                              21,
                              101,
                              93,
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
                  height: 160,
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
                        Text(
                          vendorname,
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Poppins-Medium',
                            height: 4,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(
                              255,
                              21,
                              101,
                              93,
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
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: Padding(
          padding: EdgeInsets.only(left: 17, right: 17, top: 17),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
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
                      topvendorimage: "asset/grand_auditorium.webp",
                      topvendorname: "Grand Auditorium",
                    ),
                    toplistVendor(
                      topvendorimage: "asset/wavesaloon.jpeg",
                      topvendorname: "Wavesaloon",
                    ),
                    toplistVendor(
                      topvendorimage: "asset/m.jpeg",
                      topvendorname: "Photoland",
                    ),
                    toplistVendor(
                        topvendorname: "Cake Studio",
                        topvendorimage: "asset/cakestudio.webp"),
                    toplistVendor(
                        topvendorname: "City Blooms",
                        topvendorimage: "asset/flowershop.jpeg"),
                    toplistVendor(
                        topvendorname: "Royal Catering",
                        topvendorimage: "asset/rc.png"),
                    toplistVendor(
                        topvendorname: "Dk decoration",
                        topvendorimage: "asset/dk.jpeg")
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
                        vendorimage: "asset/biscoticake.jpg",
                        vendorname: "Biscotte",
                      ),
                      listVendor(
                        vendorimage: "asset/selimakeup.jpg",
                        vendorname: "Seli beauty Lounge",
                      ),
                      listVendor(
                        vendorimage: "asset/lifemomentphoto.jpg",
                        vendorname: "Life Style Photography",
                      ),
                      listVendor(
                          vendorname: "Honey Cakes",
                          vendorimage: "asset/honeyspecialcake.jpg"),
                      listVendor(
                          vendorname: "flower shop",
                          vendorimage: "asset/cityflower.jpg"),
                      listVendor(
                          vendorname: "Eva Mose Catering",
                          vendorimage: "asset/evamosevent.webp"),
                      listVendor(
                          vendorname: "Splash Event",
                          vendorimage: "asset/SPLASHEVENT.jpg"),
                      listVendor(
                        vendorimage: "asset/grand_auditorium.webp",
                        vendorname: "Grand Auditorium",
                      ),
                      listVendor(
                        vendorimage: "asset/wavesaloon.jpeg",
                        vendorname: "Wavesaloon",
                      ),
                      listVendor(
                        vendorimage: "asset/m.jpeg",
                        vendorname: "Photoland",
                      ),
                      listVendor(
                          vendorname: "Cake Studio",
                          vendorimage: "asset/cakestudio.webp"),
                      listVendor(
                          vendorname: "City Blooms",
                          vendorimage: "asset/flowershop.jpeg"),
                      listVendor(
                          vendorname: "Royal Catering",
                          vendorimage: "asset/rc.png"),
                      listVendor(
                          vendorname: "Dk decoration",
                          vendorimage: "asset/dk.jpeg")
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
