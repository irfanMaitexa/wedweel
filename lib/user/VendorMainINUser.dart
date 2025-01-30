import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/admin/AdminBlog/AddBlog.dart';

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
    return Container(
      height: 310.h,
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
            height: 150.h,
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(vendorimage, fit: BoxFit.cover)),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            height: 130.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
            

              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      vendorname,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 27, 101, 52)),
                    ),
                    Spacer(),
                    Text(
                      "Rs : $price",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 27, 101, 52)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Row(
                      children: isVenueVendor
                          ? [
                              Icon(
                                Icons.people,
                                color: const Color.fromARGB(255, 27, 101, 52),
                              ),
                              SizedBox(width: 10),
                              Text(
                                guestcount,
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 27, 101, 52)),
                              ),
                            ]
                          : [
                              Icon(
                                Icons.star_outline,
                                color: Colors.amber,
                              ),
                              Text(
                                "(4.5)",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[700]),
                              ),
                            ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: const Color.fromARGB(255, 27, 101, 52),
                        ),
                        SizedBox(width: 10),
                        Text(
                          location,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 27, 101, 52),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.green,
                          ),
                          onPressed: () {},
                        )
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
  }
}
