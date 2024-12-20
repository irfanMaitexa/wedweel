import 'package:flutter/material.dart';

class Userhome extends StatelessWidget {
  Widget cardItems({required String name, required String photo}) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            child: Card(
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
                    height: 40,
                  ),
                  Text(name)
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
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              ListTile(
                title: Text("Discover"),
                subtitle: Text("Wedding Events"),
                trailing: Icon(Icons.notifications_none),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.teal, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "search Events"),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 200,
                // margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PageView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "asset/blogDetail.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                leading: Text("Category"),
                trailing: Text("See More "),
              ),
              Container(
                height: 300,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    cardItems(name: "Venue", photo: "asset/venue2.png"),
                    cardItems(
                        name: "Photography",
                        photo: "asset/photo-camera_5472910.png"),
                    cardItems(
                        name: "Beauty Parlor",
                        photo: "asset/cream_8337970.png"),
                    cardItems(name: "Bouquet", photo: "asset/flower.png"),
                    cardItems(name: "catering", photo: "asset/catering.png"),
                    cardItems(
                        name: "Decoration", photo: "asset/decoration.png"),
                    cardItems(
                        name: "Cake", photo: "asset/wedding-cake_5168732.png")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
