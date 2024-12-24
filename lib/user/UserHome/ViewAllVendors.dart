import 'package:flutter/material.dart';

class ViewAllVendors extends StatelessWidget {
  const ViewAllVendors({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("asset/previous 1.png",
              height: 40, width: 40, fit: BoxFit.cover),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "All Vendors",
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 21, 101, 93),
              ),
            ),
            SizedBox(
              height: 30,
            ),
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
                vendorname: "flower shop", vendorimage: "asset/cityflower.jpg"),
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
                vendorname: "Royal Catering", vendorimage: "asset/rc.png"),
            listVendor(
                vendorname: "Dk decoration", vendorimage: "asset/dk.jpeg")
          ],
        ),
      ),
    );
  }
}
