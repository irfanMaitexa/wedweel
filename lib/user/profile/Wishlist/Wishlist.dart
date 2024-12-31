import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';

class Wishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          "Wishlist",
          style: TextStyle(
            fontSize: 19,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 21, 101, 93),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10),
        itemCount: 10, // number of items
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(left: 13, right: 13, top: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 178, 215, 181),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        hall1,
                        fit: BoxFit.cover,
                        height: 100,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 6, right: 6, bottom: 6),
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Grand Hall",
                            style: TextStyle(
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 21, 101, 93)),
                          )),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 249, 255, 251),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
