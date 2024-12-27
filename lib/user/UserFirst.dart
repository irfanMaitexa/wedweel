import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/UserBlogs/UserBlogs.dart';
import 'package:intl/intl.dart';
import 'package:wedweel/user/UserHome/CardSectionGrid.dart';


class Userfirst extends StatelessWidget {
  final bool check;
  Userfirst({required this.check});
  

  String remainingDays(DateTime targetDate) {
    final now = DateTime.now();
    final difference = targetDate.difference(now).inDays.abs();
    return '$difference days to go';
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd - MM - yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    DateTime fixedDate = DateTime(2025, 12, 18);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: ListView(
            children: [
              ListTile(
                // leading: Image.asset("asset/menu.png",
                //     height: 25, width: 25, fit: BoxFit.cover),
                title: Text(
                  remainingDays(fixedDate),
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
                subtitle: Text(
                  'Wedding Date: ${formatDate(fixedDate)}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                trailing: Image.asset("asset/interface.png",
                    height: 40, width: 40, fit: BoxFit.cover),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text("Create Your Own Version\n Of Perfect Wedding",
                    style: TextStyle(
                      fontSize: 21,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 21, 101, 93),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 233, 217),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("Are you tired?",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 21, 101, 93),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Tired of looking through every single vendor of each service type? We will select a tailored package that best fits your interests.'),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 21, 101, 93),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            'Custom Package',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              check
                  ? CardSectionGrid()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "Tasks",
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
                            height: 200,
                            padding: EdgeInsets.only(left: 10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 7, right: 7),
                                    height: 150,
                                    width: 170,
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // textBaseline: TextBaseline.ideographic,

                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            hall1,
                                            height: 105,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "make up",
                                          style: TextStyle(
                                            fontSize: 17,
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
                                          "Pending",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]),
              ListTile(
                leading: Text("Recent Events"),
                trailing: Text("See All "),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  padding: EdgeInsets.only(left: 10),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
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
                                  "asset/freepik__upload__334.jpeg",
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "muhammed & fathima",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins-Medium',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "05 may 2023",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey[700]),
                                  ),
                                  SizedBox(
                                    height: 13,
                                  ),
                                  Text(
                                    "Wedding Party At The Grand Venue",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Medium',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 21, 101, 93),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Userblogs()));
                                    },
                                    child: Text(
                                      "Read More",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
