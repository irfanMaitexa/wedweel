import 'package:flutter/material.dart';
import 'package:wedweel/admin/screen/BlogDetails.dart';

class Manageblogs extends StatelessWidget {
  const Manageblogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Manage Blogs",
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
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Blogdetails(),
                    ));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          width: 300,
                          height: 170,
                          child: Image.asset('asset/images.jpeg'),
                        ),
                              
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Real Brides Reveal: One Destination Wedding Planning Hack That Will Help You Save Money!",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 20,
                            color: Color.fromARGB(255, 21, 101, 93),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
