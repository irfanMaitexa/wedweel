import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/main.dart';

class Detailpagevendor extends StatelessWidget {
  final String collectionName =
      "services"; // Replace with your actual Firestore collection name

  @override
  Widget build(BuildContext context) {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          'Product Details',
          style: TextStyle(color: Color.fromARGB(255, 21, 101, 93)),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: userId == null
          ? Center(child: Text("User not logged in"))
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(collectionName)
                  .where('vendor_id', isEqualTo: userId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No services available"));
                }

                final List<DocumentSnapshot> documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final data =
                        documents[index].data() as Map<String, dynamic>;
                    return Column(
                      children: [
                        Container(
                          height: 300.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.r),
                              bottomRight: Radius.circular(30.r),
                            ),
                            child: Image.network(
                              data['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          padding: EdgeInsets.only(left: 18.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 21, 101, 93)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                data['description'],
                                style: TextStyle(color: Colors.teal),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text("price",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 21, 101, 93))),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                data['price'],
                                style: TextStyle(color: Colors.teal),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
    );
  }
}
