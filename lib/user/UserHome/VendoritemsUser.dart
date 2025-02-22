import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/UserHome/CardSectionGrid.dart';

class Vendoritemsuser extends StatelessWidget {
  // Function to fetch top 3 vendors based on average rating
  Future<List<Map<String, dynamic>>> getTop3Vendors() async {
    // Fetch all reviews from Firestore
    final QuerySnapshot reviewSnapshot =
        await FirebaseFirestore.instance.collection('reviews').get();

    // Group reviews by vendorId
    final Map<String, List<double>> vendorRatings = {};

    for (final doc in reviewSnapshot.docs) {
      final String vendorId = doc['vendorId'];
      final double rating = doc['rating'].toDouble();

      if (vendorRatings.containsKey(vendorId)) {
        vendorRatings[vendorId]!.add(rating);
      } else {
        vendorRatings[vendorId] = [rating];
      }
    }

    // Calculate average rating for each vendor
    final List<Map<String, dynamic>> vendorsWithAverageRating = [];

    vendorRatings.forEach((vendorId, ratings) {
      final double averageRating =
          ratings.reduce((a, b) => a + b) / ratings.length;
      vendorsWithAverageRating.add({
        'vendorId': vendorId,
        'averageRating': averageRating,
        'totalReviews': ratings.length,
      });
    });

    // Sort vendors by averageRating in descending order
    vendorsWithAverageRating
        .sort((a, b) => b['averageRating'].compareTo(a['averageRating']));

    // Select top 3 vendors
    final top3Vendors = vendorsWithAverageRating.take(3).toList();

    return top3Vendors;
  }

  // Function to fetch vendor details (name and image) from the services collection
  Future<Map<String, dynamic>> getVendorDetails(String vendorId) async {
    final QuerySnapshot vendorSnapshot = await FirebaseFirestore.instance
        .collection('services')
        .where('vendor_id',
            isEqualTo: vendorId) // Match vendor_id in services collection
        .get();

    if (vendorSnapshot.docs.isNotEmpty) {
      final vendorData =
          vendorSnapshot.docs.first; // Get the first matching document
      return {
        'name': vendorData['name'], // Fetch name from services collection
        'image': vendorData['image'], // Fetch image from services collection
      };
    } else {
      return {
        'name': 'Unknown Vendor',
        'image': 'asset/biscoticake.jpg', // Fallback image
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Vendors",
            style: TextStyle(
              fontSize: 21,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              CardSectionGrid(),
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
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: getTop3Vendors(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No vendors found.'));
                    } else {
                      final top3Vendors = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: top3Vendors.length,
                        itemBuilder: (context, index) {
                          final vendor = top3Vendors[index];
                          return FutureBuilder<Map<String, dynamic>>(
                            future: getVendorDetails(vendor['vendorId']),
                            builder: (context, vendorSnapshot) {
                              if (vendorSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (vendorSnapshot.hasError) {
                                return Center(
                                    child:
                                        Text('Error: ${vendorSnapshot.error}'));
                              } else if (!vendorSnapshot.hasData) {
                                return Center(
                                    child: Text('No vendor details found.'));
                              } else {
                                final vendorDetails = vendorSnapshot.data!;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    height: 150,
                                    width: 300,
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              vendorDetails[
                                                  'image'], // Fetch image from Firestore
                                              height: 175,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'asset/biscoticake.jpg', // Fallback image
                                                  height: 175,
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  "${index + 1}",
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    fontFamily:
                                                        'Poppins-Medium',
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 21, 101, 93),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                vendorDetails[
                                                    'name'], // Fetch name from Firestore
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'Poppins-Medium',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 21, 101, 93),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              // Text(
                                              //   "Rating: ${vendor['averageRating'].toStringAsFixed(2)}",
                                              //   style: TextStyle(
                                              //     fontSize: 13,
                                              //     color: Color.fromARGB(
                                              //       255,
                                              //       21,
                                              //       101,
                                              //       93),
                                              //   ),
                                              // ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              // Text(
                                              //   "Reviews: ${vendor['totalReviews']}",
                                              //   style: TextStyle(
                                              //     fontSize: 13,
                                              //     color: Color.fromARGB(
                                              //       255,
                                              //       21,
                                              //       101,
                                              //       93),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      );
                    }
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
