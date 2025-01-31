import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/user/SearchDetailPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];
  bool _isLoading = false;

  Future<void> _searchServices(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('services')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      setState(() {
        _searchResults = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error searching: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Enter Vendor name...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search, color: Colors.teal[600]),
              onPressed: () {
                _searchServices(_searchController.text.trim());
              },
            ),
          ),
          onSubmitted: (value) {
            _searchServices(value.trim());
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : _searchResults.isEmpty
                    ? Center(child: Text('No data found.'))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            final service = _searchResults[index];
                            return ListTile(
                              leading: service['image'] != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        service['image'],
                                        width: 70.w,
                                        height: 70.h,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Icon(Icons.image, size: 50.w),
                              title: Text(service['name'] ?? 'No Name'),
                              subtitle:
                                  Text(service['location'] ?? 'No location'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Searchdetailpage(
                                      id: service['id'] ?? '',
                                      isVenueVendor: false,
                                      location: service['location'] ?? 'No location',
                                      price: service['price'] ?? 0,
                                      vendordescription: service['description'] ?? 'No description',
                                      vendorimage: service['image'] ?? '',
                                      vendorname: service['name'] ?? 'No name',
                                      
                                      phonenumber: service['phone'] ?? 'No phone number',
                                    ),
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