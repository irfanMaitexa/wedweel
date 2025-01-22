import 'package:flutter/material.dart';

class Blogdetail extends StatelessWidget {
  final String blogtitle;
  final String blogdescription;
  final String blogimage;
  final String blogdate;
  final String readtime;

  Blogdetail({required this.blogtitle, required this.blogdescription, required this.blogimage, required this.blogdate, required this.readtime});
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    blogimage,
                    // height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  blogtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 21, 101, 93),
                  ),
                ),
              
               
              ),
             
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Wonderful Wedding Party",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 21, 101, 93),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(blogdescription,style:  TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 15,
                      ),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
