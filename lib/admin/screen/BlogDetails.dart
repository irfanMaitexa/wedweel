import 'package:flutter/material.dart';

class Blogdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 23,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                "Real Brides Reveal: One Destination Wedding Planning Hack That Will Help You Save Money!",
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 23,
                    color: Color.fromARGB(255, 21, 101, 93),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("   BY Apoorva   | "),
              SizedBox(
                width: 8,
              ),
              Text("03 Dec, 2024  |  "),
              SizedBox(
                width: 8,
              ),
              Text("3 min read    "),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.network(
                "https://image.wedmegood.com/resized-nw/1300X/wp-content/uploads/2024/11/VKR622111-1.jpg"),
          ),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: EdgeInsets.only(left: 11),
            child: Text(
              "Dreaming of a destination wedding without that “how am I going to afford this” stress? You’re not alone! Whether it’s the beaches of Goa, the palaces of Jaipur, or a villa in Bali, having a stunning wedding away from home doesn’t have to drain your bank account. We asked real brides who’ve been there and done that to spill their best budget-saving hacks for planning a destination wedding — and they delivered! From snagging the best deals on venues to finding unexpected ways to save, here’s the tea you need.",
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
