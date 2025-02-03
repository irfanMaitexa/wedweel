import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendorReviewsPage extends StatefulWidget {
  @override
  _VendorReviewsPageState createState() => _VendorReviewsPageState();
}

class _VendorReviewsPageState extends State<VendorReviewsPage> {
  final String vendorId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    print(vendorId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vendor Reviews",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("reviews")
                    .where("vendorId", isEqualTo: vendorId)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text("No reviews yet."));
                  }

                  print("Total reviews: ${snapshot.data!.docs.length}");

                  var reviews = snapshot.data!.docs;

                  return Column(
                    children: [
                      Text(
                        "Total Reviews: ${reviews.length}",
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        child: ListView.builder(
                          itemCount: reviews.length,
                          itemBuilder: (context, index) {
                            var review = reviews[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              child: ListTile(
                                leading: Icon(Icons.reviews, color: Colors.teal),
                                title: Text(review["username"] ?? "Anonymous"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Rating: ${review["rating"]}/5"),
                                    Text("Comment: ${review["review"]}")
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}