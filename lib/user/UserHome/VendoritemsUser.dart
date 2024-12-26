import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/UserHome/VendorList.dart';
import 'package:wedweel/user/userphotography/photographyVendor.dart';

class Vendoritemsuser extends StatelessWidget {
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
        appBar: AppBar(
          title: Text("Vendors",
              style: TextStyle(
                fontSize: 21,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 21, 101, 93),
              )),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Vendors",
                  prefixIcon: Icon(Icons.search, color: Colors.teal),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.teal, width: 1)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text("Categories",
                    style: TextStyle(
                      fontSize: 21,
                      height: 3,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 21, 101, 93),
                    )),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Photographyvendor()));
                          },
                          child: cardItems(
                              name: "Photo",
                              photo: "asset/photo-camera_5472910.png"),
                        ),
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Top Vendors",
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
                height: 180,
                padding: EdgeInsets.only(left: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 150,
                        width: 300,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,

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
                                  hall1,
                                  height: 175,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "0 1",
                                    style: TextStyle(
                                      fontSize: 30,
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
                                    "Grand View",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromARGB(
                                          255,
                                          21,
                                          101,
                                          93,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 13,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
