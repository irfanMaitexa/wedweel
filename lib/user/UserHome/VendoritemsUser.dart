import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/UserHome/CardSectionGrid.dart';


class Vendoritemsuser extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Vendors",
              style: TextStyle(
                fontSize: 21,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 21, 101, 93),
              )),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(
               height: 30,
             ),
             CardSectionGrid(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Top Vendors",
                  style: TextStyle(
                    fontSize: 21,
                    height: 3,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 21, 101, 93),
                  ),
                ),
              ),
              Container(
                height: 180,
                padding: EdgeInsets.only(left: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 150,
                        width: 300,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.white,
                        ),
                        child: Row(
                          // textBaseline: TextBaseline.ideographic,

                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  hall1,
                                  height: 175,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "0 1",
                                    style: TextStyle(
                                      fontSize: 30,
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
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Grand View",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromARGB(
                                          255,
                                          21,
                                          101,
                                          93,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 13,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
