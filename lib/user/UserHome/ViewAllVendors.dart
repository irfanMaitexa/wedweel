import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
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
            listVendor(vendorname: "Honey Cakes", vendorimage: cakeshop2),
            listVendor(vendorname: "flower shop", vendorimage: flowershop2),
            listVendor(vendorname: "Eva Mose Catering", vendorimage: catering2),
            listVendor(vendorname: "Splash Event", vendorimage: decoration2),
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
            listVendor(vendorname: "Cake Studio", vendorimage: cakeshop1),
            listVendor(vendorname: "City Blooms", vendorimage: flowershop1),
            listVendor(vendorname: "Royal Catering", vendorimage: catering1),
            listVendor(vendorname: "Dk decoration", vendorimage: decoration1),
          ],
        ),
      ),
    );
  }
}
