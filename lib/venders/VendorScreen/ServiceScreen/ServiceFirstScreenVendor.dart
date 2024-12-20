import 'package:flutter/material.dart';

import 'package:wedweel/venders/VendorScreen/ServiceScreen/AddServiceVendor.dart';
import 'package:wedweel/venders/VendorScreen/ServiceScreen/EditServiceVendor.dart';

class ServiceFirstScreen extends StatelessWidget {
  Widget screenContainer({
    required String name,
    required String image,
  }) {
    return Container(
      height: 90,
      width: 50,
      // margin: EdgeInsets.only(
      //   left: 10,
      // ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 95,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins-Regular',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
      ),
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
            mainAxisSpacing: 17,
            crossAxisSpacing: 17,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: screenContainer(
                      name: "Product Details",
                      image: "asset/information_14875512.png")),
              InkWell(
                  splashColor: Colors.greenAccent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Addservicevendor()));
                  },
                  child: screenContainer(
                      name: "Add Service", image: "asset/essay_3253267.png")),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Editservicevendor()));
                  },
                  child: screenContainer(
                      name: "Edit Service",
                      image: 'asset/engineering_13337559.png')),
            ],
          ),
        ],
      ),
    );
  }
}
