import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Vendormaindetails extends StatelessWidget {
  final String vendorname;
  final String location;
  final String vendorimage;
  final String price;
  final String vendordescription;
  final bool isVenueVendor;
  final String guestnumber;
  final String phonenumber;
  final String id;

  Vendormaindetails({
    required this.id,
    this.phonenumber = " ",
    this.guestnumber = " ",
    required this.vendorname,
    required this.isVenueVendor,
    required this.location,
    required this.vendorimage,
    required this.price,
    required this.vendordescription,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 170.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  vendorimage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text(vendorname,
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 21, 101, 93))),
              trailing: Text(
                "Rs: $price",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 21, 101, 93)),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 10),
                        Text("5.0"),
                        SizedBox(width: 10),
                        Text("(2348 Reviews)"),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    isVenueVendor
                        ? Row(
                            children: [
                              Icon(
                                Icons.people,
                                color: Color.fromARGB(255, 21, 101, 93),
                              ),
                              SizedBox(width: 10),
                              Text(guestnumber),
                            ],
                          )
                        : SizedBox(
                            height: 10.h,
                          ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: Color.fromARGB(255, 21, 101, 93)),
                        SizedBox(width: 10),
                        Text(location),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [Text("Contact"), Spacer(), Text(phonenumber)],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TabBar(
                      tabs: [
                        Tab(text: 'Description'),
                        Tab(text: 'Review'),
                        Tab(text: 'Slot'),
                      ],
                      labelColor: const Color.fromARGB(255, 27, 95, 58),
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: const Color.fromARGB(255, 212, 209, 51),
                    ),
                    // TabBarView
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Description Tab
                          Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10, right: 10),
                                      child: Text(vendordescription),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 178, 215, 181),
                                    minimumSize: Size(double.infinity, 40),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ],
                          ),
                          // Review Tab
                          Column(
                            children: [
                              Expanded(
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('reviews')
                                      .where('vendorId', isEqualTo: id)
                                      .orderBy('timestamp', descending: true)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }

                                    if (!snapshot.hasData ||
                                        snapshot.data!.docs.isEmpty) {
                                      return Center(
                                          child: Text("No reviews yet."));
                                    }

                                    return ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        final review =
                                            snapshot.data!.docs[index];
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: CircleAvatar(
                                                radius: 20,
                                                child: Text(review['username'][
                                                    0]), // First letter of username
                                              ),
                                              title: Text(review[
                                                  'username']), // Display username
                                              subtitle: Text(
                                                  "Rating: ${review['rating']}"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16, right: 16),
                                              child: Text(review['review']),
                                            ),
                                            Divider(
                                              height: 20.h,
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 178, 215, 181),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          ReviewDialog(vendorId: id),
                                    );
                                  },
                                  child: Text(
                                    "Add review",
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 18, 95, 57)),
                                  ))
                            ],
                          ),
                          // Slot Tab
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text("date"),
                                    subtitle: Text("time"),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewDialog extends StatefulWidget {
  final String vendorId;

  ReviewDialog({required this.vendorId});

  @override
  _ReviewDialogState createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0;
  String _username = "Guest"; // Default username

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          _username = userDoc['fullname']; // Fetch username from Firestore
        });
      }
    }
  }

  Future<void> _saveReview() async {
    final String review = _reviewController.text;
    final double rating = _rating;

    if (review.isNotEmpty && rating > 0) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('reviews').add({
          'vendorId': widget.vendorId,
          'rating': rating,
          'review': review,
          'username': _username, // Store username
          'timestamp': FieldValue.serverTimestamp(),
        });

        Navigator.of(context).pop(); // Close the dialog
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You must be logged in to submit a review.")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please provide a rating and review.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Review"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Rating Bar
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
              size: 10,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),
          SizedBox(height: 20),
          // Review Description
          TextField(
            controller: _reviewController,
            decoration: InputDecoration(
              hintText: "Write your review...",
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: _saveReview,
          child: Text("Submit"),
        ),
      ],
    );
  }
}
