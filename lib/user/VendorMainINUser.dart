import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Vendormaininuser extends StatelessWidget {
  final String vendorname;
  final String location;
  final String price;
  final String vendorimage;
  final String guestcount;
  final bool isVenueVendor;

  Vendormaininuser({
    required this.vendorname,
    this.guestcount = "",
    required this.location,
    required this.price,
    required this.vendorimage,
    required this.isVenueVendor,
  });

  // Function to toggle wishlist
  Future<void> toggleWishlist(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle the case where the user is not logged in
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You need to be logged in to manage wishlist')),
      );
      return;
    }

    // Reference to the user's wishlist subcollection
    final wishlistRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('wishlist')
        .doc(vendorname); // Use vendorname as the document ID

    // Check if the item is already in the wishlist
    final doc = await wishlistRef.get();
    if (doc.exists) {
      // Remove from wishlist
      await wishlistRef.delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Removed from wishlist')),
      );
    } else {
      // Add to wishlist
      await wishlistRef.set({
        
        'vendorname': vendorname,
        'location': location,
        'price': price,
        'vendorimage': vendorimage,
        'guestcount': guestcount,
        'isVenueVendor': isVenueVendor,
        'timestamp': FieldValue.serverTimestamp(), // Optional: Add timestamp
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added to wishlist')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      height: 310.h,
      margin: EdgeInsets.only(
        left: 27,
        right: 27,
        top: 20,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 178, 215, 181)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            height: 150.h,
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(vendorimage, fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            height: 130.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      vendorname,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 27, 101, 52)),
                    ),
                    Spacer(),
                    Text(
                      "Rs : $price",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 27, 101, 52)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Row(
                      children: isVenueVendor
                          ? [
                              Icon(
                                Icons.people,
                                color: const Color.fromARGB(255, 27, 101, 52),
                              ),
                              SizedBox(width: 10),
                              Text(
                                guestcount,
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 27, 101, 52)),
                              ),
                            ]
                          : [
                              Icon(
                                Icons.star_outline,
                                color: Colors.amber,
                              ),
                              Text(
                                "(4.5)",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[700]),
                              ),
                            ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: const Color.fromARGB(255, 27, 101, 52),
                        ),
                        SizedBox(width: 10),
                        Text(
                          location,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 27, 101, 52),
                          ),
                        ),
                        Spacer(),
                        StreamBuilder<DocumentSnapshot>(
                          stream: user != null
                              ? FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(user.uid)
                                  .collection('wishlist')
                                  .doc(vendorname)
                                  .snapshots()
                              : null,
                          builder: (context, snapshot) {
                            final isInWishlist = snapshot.data?.exists ?? false;
                            return IconButton(
                              icon: Icon(
                                isInWishlist
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isInWishlist
                                    ? const Color.fromARGB(255, 32, 120, 51)
                                    : Colors.green,
                              ),
                              onPressed: () => toggleWishlist(context),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
