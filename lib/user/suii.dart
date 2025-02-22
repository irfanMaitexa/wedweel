import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminServicesPage extends StatelessWidget {
  // Function to fetch all services from the Firestore collection
  Future<List<Map<String, dynamic>>> fetchAllServices() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('services').get();

    // Convert documents to a list of maps
    final List<Map<String, dynamic>> services =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    // Print all vendor details to the console
    for (final service in services) {
      print('Vendor Details:');
      print('Name: ${service['name']}');
      print('Category: ${service['category']}');
      print('Location: ${service['location']}');
      print('Price: ${service['price']}');
      print('Description: ${service['description']}');
      print('Image: ${service['image']}');
      print('Vendor ID: ${service['vendor_id']}');
      print('Phone: ${service['phone']}');
      print('----------------------------------');
    }

    return services;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Services",
          style: TextStyle(
            fontSize: 21,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchAllServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No services found.'));
          } else {
            final services = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: services.length,
              itemBuilder: (context, index) {
                print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$index');
                final service = services[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display service image
                        if (service['image'] != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              service['image'],
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 150,
                                  color: Colors.grey[300],
                                  child: Icon(Icons.broken_image,
                                      color: Colors.grey[600]),
                                );
                              },
                            ),
                          ),
                        SizedBox(height: 16),
                        // Display service name
                        Text(
                          service['name'] ?? 'No Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Display category
                        Text(
                          "Category: ${service['category'] ?? 'No Category'}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8),
                        // Display location
                        Text(
                          "Location: ${service['location'] ?? 'No Location'}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8),
                        // Display price
                        Text(
                          "Price: ₹${service['price'] ?? 'N/A'}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8),
                        // Display description
                        Text(
                          service['description'] ?? 'No Description',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
