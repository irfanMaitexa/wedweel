import 'package:flutter/material.dart';

class Managevendordetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 210,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 88, 88, 88),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: const Color.fromARGB(255, 245, 255, 245),
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Royal Catering",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Poppins-Medium',
                          color: Color.fromARGB(255, 1, 58, 3),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 27,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Calicut",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 27,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "5.0",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 245, 255, 245),
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "+91906111111",
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium', fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.call,
                          size: 30,
                          color: const Color.fromARGB(255, 1, 58, 3),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Colors.grey[350],
                    ),
                    Row(
                      children: [
                        Text(
                          "Royal@gmail.com",
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium', fontSize: 18),
                        ),
                        Spacer(),
                        Icon(
                          Icons.email,
                          size: 30,
                          color: const Color.fromARGB(255, 1, 58, 3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 245, 255, 245),
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(children: [
                      Icon(
                        Icons.picture_as_pdf,
                        size: 30,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'View Document',
                            style: TextStyle(
                                fontFamily: 'Poppins-Medium',
                                fontSize: 20,
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ))
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
