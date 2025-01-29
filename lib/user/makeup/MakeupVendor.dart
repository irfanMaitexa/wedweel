import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedweel/user/VendorMainINUser.dart';
import 'package:wedweel/user/makeup/MakeupDetails.dart';


class Makeupvendor extends StatelessWidget {
  final String collectionName = "services"; 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(collectionName)
              .where('category', isEqualTo: 'makeup') // Filter by category
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No  makeup vendors available"));
            }

            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return Container(
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          margin: EdgeInsets.only(left: 20, right: 10, top: 30),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Search Vendors",
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.teal),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.teal, width: 1)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.teal,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        final data =
                            documents[index].data() as Map<String, dynamic>;

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Makeupdetails(

                                  number: data['phone'] ?? 'No Phone',
                                  name: data['name'] ?? 'No Name',
                                  vendorlocation: data['location'] ?? 'No Location',
                                  vendorprice: data['price'] ?? 'No Price',
                                  vendorphoto: data['image'] ?? '',
                                  vendorDescription:
                                      data['description'] ?? 'No Description',
                                  vendorcategory: data['category'] ?? 'No Category',
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Vendormaininuser(
                              vendorname: data['name'] ?? 'No Name',
                              location: data['location'] ?? 'No Location',
                              price: data['price'] ?? 'No Price',
                              vendorimage: data['image'] ?? '',
                              isVenueVendor:
                                  false, 
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
