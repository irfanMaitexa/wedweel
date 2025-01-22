import 'package:flutter/material.dart';

class Viewblogvendor extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Container(
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
                                child: Image.network(
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
                                  Text(
                                    "Read More",
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
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
        ],
      ),
    );
  }
}