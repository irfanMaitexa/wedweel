import 'package:flutter/material.dart';

class Manageuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Manage User",
            style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 23,
                color: Color.fromARGB(255, 21, 101, 93),
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Color.fromARGB(255, 238, 255, 247),
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "muhammed hisam",
                        style: TextStyle(
                            fontFamily: 'Poppins-Medium', fontSize: 20),
                      ),
                      Spacer(),
                      Icon(
                        Icons.badge,
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
                      Text("kHl0s@example.com",
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium', fontSize: 18)),
                      Spacer(),
                      Icon(
                        Icons.mail,
                        size: 30,
                        color: const Color.fromARGB(255, 1, 58, 3),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
