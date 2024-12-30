import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';

class Vendormaindetails extends StatelessWidget {
  final String vendorname;
  final String location;
  final String vendorimage;
  final String price;
  final String vendordescription;
  final bool isVenueVendor;

  Vendormaindetails({
    required this.vendorname,
    required this.isVenueVendor,
    required this.location,
    required this.vendorimage,
    required this.price,
    required this.vendordescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              vendorimage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          title: Text(vendorname),
          trailing: Text(price),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 18, right: 18),
            // height: 500,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 10),
                    Text("5.0"),
                    SizedBox(width: 10),
                    Text("(2348 Reviews)"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                isVenueVendor
                    ? Row(
                        children: [
                          Icon(
                            Icons.people,
                            color: Color.fromARGB(255, 21, 101, 93),
                          ),
                          SizedBox(width: 10),
                          Text("1000 Guest")
                        ],
                      )
                    : SizedBox(
                        height: 10,
                      ),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        color: Color.fromARGB(255, 21, 101, 93)),
                    SizedBox(width: 10),
                    Text(location),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins-Medium',
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  vendordescription,
                  style: TextStyle(fontSize: 11, color: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Contact",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins-Medium',
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Phone: 1234567890",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email: 3q5W5@example.com",
                      style: TextStyle(fontSize: 12),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Book Now",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 178, 215, 181),
                      minimumSize: Size(double.infinity, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
