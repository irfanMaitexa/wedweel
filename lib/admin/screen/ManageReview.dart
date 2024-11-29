import 'package:flutter/material.dart';

class Managereview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Manage Review",
          style: TextStyle(
             fontFamily: 'Poppins-Regular',
                fontSize: 23,
                color: Color.fromARGB(255, 21, 101, 93),
                fontWeight: FontWeight.w500
          ),),
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
                        Text("ajay kumar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins-Bold',
                              fontSize: 18,
                            )),
                        Spacer(),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 30,
                    ),
                    Text(
                        "WedWheel has been an absolute lifesaver! It's so organized and easy to use. I love the vendor directory, especially the reviews and ratings. The budget tracker has helped me stay on top of my finances, and the checklist has kept me organized throughout the entire planning process. Highly recommend!"),
                        
                  ],
                ),
              ),
            );
          }),
    );
  }
}
