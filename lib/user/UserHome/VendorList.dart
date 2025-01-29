import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedweel/user/AllVendorDetailsUser.dart';

class Vendorlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor List'),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('services').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            final data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final vendorData = data[index].data() as Map<String, dynamic>;
                final vendorimage = vendorData['image'] ?? '';
                final vendorname = vendorData['name'] ?? 'No Name';
                final price = vendorData['price'] ?? 'N/A';
                final location = vendorData['location'] ?? 'Unknown Location';
                final guestcount = vendorData['number_of_guests'] ?? 'N/A';

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Allvendordetailsuser(
                              id: data[index].id,
                              phonenumber: data[index]['phone'],
                              vendorname: data[index]['name'],
                              location: data[index]['location'],
                              vendorimage: data[index]['image'],
                              price: data[index]['price'],
                              vendordescription: data[index]['description']),
                        ));
                  },
                  child: Container(
                    height: 310,
                    margin: EdgeInsets.only(
                      left: 27,
                      right: 27,
                      top: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 178, 215, 181),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          height: 150,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              vendorimage,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(Icons.error, color: Colors.red),
                                );
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(vendorname),
                                trailing: Text(price),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.location_on),
                                        SizedBox(width: 10),
                                        Text(location),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: data[index]['category'] ==
                                              'venue'
                                          ? [
                                              Icon(Icons.people),
                                              SizedBox(width: 10),
                                              Text(guestcount),
                                            ]
                                          : [
                                              Icon(
                                                Icons.star_outline,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                "(4.5)",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[700]),
                                              ),
                                            ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
