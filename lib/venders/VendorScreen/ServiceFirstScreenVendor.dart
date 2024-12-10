import 'package:flutter/material.dart';
import 'package:wedweel/venders/VendorScreen/AddServiceVendor.dart';
import 'package:wedweel/venders/VendorScreen/EditServiceVendor.dart';

class ServiceFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("My  Service "),
      //   backgroundColor: Color.fromARGB(255, 237, 250, 244),
      // ),
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "My Service",
              style: TextStyle(
                  fontSize: 27, color: Color.fromARGB(255, 21, 101, 93)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          GridView.count(
            padding: EdgeInsets.all(15),
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 20,
            crossAxisSpacing: 7,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 90,
                  width: 50,
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'asset/information_14875512.png',
                        fit: BoxFit.cover,
                        height: 80,
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Text(
                        "Product Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.greenAccent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Addservicevendor()));
                },
                child: Container(
                  height: 90,
                  width: 50,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'asset/essay_3253267.png',
                        fit: BoxFit.cover,
                        height: 80,
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Text(
                        "Add Service",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Editservicevendor()));
                },
                child: Container(
                  height: 90,
                  width: 50,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'asset/engineering_13337559.png',
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Text(
                        "Edit Service",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
