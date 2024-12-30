import 'dart:math';

import 'package:flutter/material.dart';

class Vendormaininuser extends StatelessWidget {
  final String vendorname;
  final String location;
  final String price;
  final String vendorimage;
  final String guestcount;

  final bool isVenueVendor;

  Vendormaininuser(
      {required this.vendorname,
      this.guestcount = "",
      required this.location,
      required this.price,
      required this.vendorimage,
      required this.isVenueVendor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                margin: EdgeInsets.only(left: 20, right: 10, top: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search Vendors",
                    prefixIcon: Icon(Icons.search, color: Colors.teal),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.teal, width: 1)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, top: 20),
              child: Icon(
                Icons.filter_alt_outlined,
                color: Colors.teal,
                size: 30,
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 310,
                  margin: EdgeInsets.only(
                    left: 27,
                    right: 27,
                    top: 20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 178, 215, 181)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        height: 150,
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(vendorimage, fit: BoxFit.cover)),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        height: 130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          ListTile(
                            title: Text(vendorname),
                            trailing: Text(price),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_on),
                                    SizedBox(width: 10),
                                    Text(location),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: isVenueVendor
                                      ? [
                                          Icon(Icons.people),
                                          SizedBox(width: 10),
                                          Text(guestcount),
                                        ]
                                      : [
                                          Icon(
                                            Icons.star_outline,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            "(4.5)",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[700]),
                                          ),
                                        ],
                                ),
                              ],
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
