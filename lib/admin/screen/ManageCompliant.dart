import 'package:flutter/material.dart';

class Managecompliant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Manage Compliant",
          style: TextStyle(
              fontFamily: 'Poppins-Regular',
              fontSize: 23,
              color: Color.fromARGB(255, 21, 101, 93),
              fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              color: Color.fromARGB(255, 238, 255, 247),
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mufeeda",
                          style: TextStyle(
                              fontFamily: 'Poppins-medium',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(
                          Icons.person,
                        )
                      ],
                    ),
                    Divider(
                      height: 38,
                      color: Colors.grey,
                    ),
                    Text(
                        "While I initially found the app helpful, I encountered a few issues. The vendor directory, while extensive, lacked detailed information about some vendors. Additionally, the app crashed a few times during the planning process. I hope these issues can be addressed in future updates."),
                    SizedBox(
                      height: 30,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                      title: Text(
                                        "Replay",
                                        style: TextStyle(
                                            fontFamily: 'Poppins-medium',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 21, 101, 93)),
                                      ),
                                      content: TextField(),
                                      actions: [
                                        TextButton(
                                            onPressed: () {},
                                            child: Text("Cancel",
                                                style: TextStyle(
                                                  fontFamily: 'Poppins-medium',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ))),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Ok",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins-medium',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      ]));
                        },
                        child: Text(
                          "Replay ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          backgroundColor: Color.fromARGB(255, 21, 101, 93),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ])
                  ],
                ),
              ),
            );
          }),
    );
  }
}
