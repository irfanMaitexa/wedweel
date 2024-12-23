import 'package:flutter/material.dart';
import 'package:wedweel/user/UserBlogs/UserBlogs.dart';
import 'package:wedweel/user/UserHome/VendorList.dart';

class Userfirst extends StatelessWidget {
  Widget cardItems({
    required String name,
    required String photo,
    double imageheight = 35,
    double imagewidth = 35,
  }) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 200,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    photo,
                    fit: BoxFit.cover,
                    height: imageheight,
                    width: imagewidth,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset("asset/menu.png",
                    height: 25, width: 25, fit: BoxFit.cover),
                trailing: Image.asset("asset/notification.png",
                    height: 25, width: 25, fit: BoxFit.cover),
              ),
              SizedBox(
                height: 40,
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 20, right: 20, ),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(15),
              //           borderSide: BorderSide(color: Colors.teal, width: 1),
              //         ),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(15),
              //         ),
              //         hintText: "search Events"),
              //   ),
              // ),
              // SizedBox(
              //   height: 40,
              // ),
              Text("Create Your Own Version\n Of Perfect Wedding",
                  style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 21, 101, 93),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 250,
                  child: GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 8,
                      childAspectRatio: .8,
                      // padding: const EdgeInsets.all(12),

                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Vendorlist()));
                          },
                          child: cardItems(
                            name: "Vendor",
                            photo: "asset/person.png",
                            imageheight: 30,
                            imagewidth: 30,
                          ),
                        ),
                        cardItems(name: "Venue", photo: "asset/venue2.png"),
                        cardItems(
                            name: "Photo",
                            photo: "asset/photo-camera_5472910.png"),
                        cardItems(
                            name: "Make up", photo: "asset/cream_8337970.png"),
                        cardItems(
                            name: "Flower",
                            photo: "asset/flower.png",
                            imageheight: 45,
                            imagewidth: 45),
                        cardItems(
                            name: "Food ",
                            photo: "asset/catering.png",
                            imageheight: 45,
                            imagewidth: 45),
                        cardItems(
                            name: "Decoration ", photo: "asset/decoration.png"),
                        cardItems(
                            name: "cake ",
                            photo: "asset/wedding-cake_5168732.png"),
                      ])),
              ListTile(
                leading: Text("Recent Events"),
                trailing: Text("See All "),
              ),
              Expanded(
                child: Container(
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
