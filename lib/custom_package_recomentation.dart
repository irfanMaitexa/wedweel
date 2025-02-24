import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BestServiceScreen extends StatefulWidget {
  const BestServiceScreen({super.key});

  @override
  _BestServiceScreenState createState() => _BestServiceScreenState();
}

class _BestServiceScreenState extends State<BestServiceScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  String? selectedCategory;

  Stream<List<Map<String, dynamic>>> getBestService(String location, double budget, String? category) {
    return FirebaseFirestore.instance.collection('services').snapshots().asyncMap((serviceSnapshot) async {
      List<Map<String, dynamic>> serviceList = [];

      for (var service in serviceSnapshot.docs) {
        var data = service.data();
        if (data['location'] == location && double.parse(data['price']) <= budget && (category == null || data['category'] == category)) {
          var vendorDoc = await FirebaseFirestore.instance.collection('vendor').doc(data['vendor_id']).get();
          if (vendorDoc.exists && vendorDoc.data()?['IsAdminApproved'] == true) {
            var reviewsSnapshot = await FirebaseFirestore.instance
                .collection('reviews')
                .where('vendorId', isEqualTo: data['vendor_id'])
                .get();

            double avgRating = reviewsSnapshot.docs.isNotEmpty
                ? reviewsSnapshot.docs.map((r) => r['rating'] as num).reduce((a, b) => a + b) / reviewsSnapshot.docs.length
                : 0;

            serviceList.add({...data, 'avgRating': avgRating});
          }
        }
      }
      serviceList.sort((a, b) => b['avgRating'].compareTo(a['avgRating']));
      return serviceList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Best Service")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: "Enter Location"),
            ),
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter Budget"),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('services').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                var categories = snapshot.data!.docs.map((doc) => doc['category'] as String).toSet().toList();
                return DropdownButton<String>(
                  value: selectedCategory,
                  hint: const Text("Select Category"),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  items: categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text("Find Best Service"),
            ),
            Expanded(
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: getBestService(_locationController.text, double.tryParse(_budgetController.text) ?? 0, selectedCategory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No matching services found"));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var service = snapshot.data![index];
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(service['image'], height: 200, width: double.infinity, fit: BoxFit.cover),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(service['name'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 5),
                                  Text(service['description'], maxLines: 3, overflow: TextOverflow.ellipsis),
                                  const SizedBox(height: 10),
                                  Text("Price: ₹${service['price']}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                  Text("Rating: ${service['avgRating'].toStringAsFixed(1)} ⭐", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
