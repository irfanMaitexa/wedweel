import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class VendorReviewScreen extends StatelessWidget {
  Widget reviewtitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Overall",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          "Quality of Service",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          "Communication",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )
      ],
    );
  }

  Widget verfication({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          width: 4,
        ),
        Icon(Icons.verified, color: Colors.green)
      ],
    );
  }

  Widget rating({double? rating}) {
    return RatingBar.readOnly(
      filledIcon: Icons.star,
      emptyIcon: Icons.star_border,
      initialRating: rating ?? 0,
      maxRating: 5,
      size: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 237, 250, 244)),
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "112 Reviews",
                        style: TextStyle(
                            fontSize: 27,
                            color: Color.fromARGB(255, 21, 101, 93)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      reviewtitle(),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          rating(rating: 4.5),
                          rating(rating: 4),
                          rating(rating: 3.5),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                          " provided excellent service for our wedding. They were highly professional, responsive, and delivered on their promises. "),
                      SizedBox(
                        height: 15,
                      ),
                      verfication(name: "12 Dec 2024  ajmal khan"),
                      Divider(
                        color: Colors.grey[500],
                        height: 45,
                      ),
                      reviewtitle(),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          rating(rating: 4),
                          rating(rating: 5),
                          rating(rating: 3),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                          " I had a great experience with this wedding planner. They were incredibly helpful and patient throughout the entire wedding planning process. "),
                      SizedBox(
                        height: 15,
                      ),
                      verfication(name: "24 jan 2023  Anas "),
                      Divider(
                        color: Colors.grey[500],
                        height: 45,
                      ),
                      reviewtitle(),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          rating(rating: 4.5),
                          rating(rating: 4),
                          rating(rating: 3.5),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                          " WedCom was a mixed bag. While they were professional and timely, there were some areas where they could improve.\nPros:\nPunctuality: They were always on time for appointments and meetings.\nProfessionalism: Their demeanor was courteous and respectful.\nCreativity: They offered unique and innovative ideas for our wedding.\nCons:\nCommunication: Sometimes, communication could be a bit slow, leading to minor delays.\nBudgeting: Their initial quote was a bit higher than expected.Overall, we were satisfied with their services. \nHowever, they could improve their communication and pricing transparency.\n"),
                      SizedBox(
                        height: 15,
                      ),
                      verfication(name: "25 Feb 2024  Mufeeda"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
