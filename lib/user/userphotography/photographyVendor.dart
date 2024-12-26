import 'package:flutter/material.dart';
import 'package:wedweel/imageVendor.dart';

class Photographyvendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text("Photography",
                  style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 21, 101, 93),
                  )),
            ),
            backgroundColor: Color.fromARGB(255, 237, 250, 244),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            photography3,
                            height: 125,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text("Photland",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins-Regular',
                                height: 2)),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            Text("20000", style: TextStyle(fontSize: 14)),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_outline,
                                  color: Colors.amber,
                                ),
                                Text("(4.5)",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[700])),
                              ],
                            ),
                          ],
                        )
                      ],
                    ));
              },
            )));
  }
}
