import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wedweel/imageVendor.dart';

class Userbooking extends StatelessWidget {
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd - MM - yyyy');
    return formatter.format(date);
  }

  Widget listContainer({required String vendorname}) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 255, 251),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Text(vendorname),
        trailing: Text("View details"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime(2024, 12, 18);
    DateTime endDate = DateTime(2025, 6, 1);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'My Bookings',
          style: TextStyle(
            fontSize: 19,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 21, 101, 93),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 10, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Wedding Date",
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 21, 101, 93),
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("From "), Text("To")],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 35,
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 249, 255, 251)),
                  child: Text(
                    formatDate(startDate),
                    style: TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 42, 35, 35)),
                  ),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 249, 255, 251)),
                  child: Text(
                    formatDate(endDate),
                    style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 42, 35, 35)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Wedding Venue",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 21, 101, 93)),
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      hall1,
                      fit: BoxFit.cover,
                      height: 95,
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("Grand Hall"),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 21, 101, 93),
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("calicut"),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
            Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  "Vendors",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 21, 101, 93)),
                )),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: ListView(
                  children: [
                    listContainer(vendorname: "photography"),
                    listContainer(vendorname: "Make Up"),
                    listContainer(vendorname: "Flowers"),
                    listContainer(vendorname: "food"),
                    listContainer(vendorname: "Decoration"),
                    listContainer(vendorname: "Cake")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
