import 'package:flutter/material.dart';

class Vendorlist extends StatelessWidget {
  @override
  Widget listVendor(
      {required String vendorname,
      required String vendorimage,
      String vendoraddress = "Calicut, Kerala",
      String vendorthing = " "}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        height: 330,
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
                  height: 190,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vendorname,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 21, 101, 93),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.menu_outlined,
                                color: Color.fromARGB(255, 21, 101, 93),
                              ),
                              onPressed: () {
                                // Add your menu button action here
                              },
                            ),
                          ],
                        ),
                        Text(
                          vendorthing,
                          style: TextStyle(height: 4),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              vendoraddress,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Vendor List",
          style: TextStyle(
            fontSize: 21,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 21, 101, 93),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 17),
          child: ListView(
            children: [
              listVendor(
                  vendorimage: "asset/grand_auditorium.webp",
                  vendorname: "Grand Auditorium",
                  vendorthing: "Capacity 1000 Guests"),
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
                  vendorname: "Royal Catering", vendorimage: "asset/rc.png"),
                  listVendor(vendorname: "Dk decoration", vendorimage: "asset/dk.jpeg")
            ],
          )),
    );
  }
}
