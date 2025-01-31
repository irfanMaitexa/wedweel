import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/user/SearchDetailPage.dart';

class Searchpage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<Searchpage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];
  List<String> _suggestions = [];
  bool _isLoading = false;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  // Fetch suggestions dynamically as user types
  void _fetchSuggestions(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () async {
      if (query.isEmpty) {
        setState(() => _suggestions = []);
        return;
      }

      try {
        final snapshot = await FirebaseFirestore.instance
            .collection('services')
            .where('name', isGreaterThanOrEqualTo: query)
            .where('name', isLessThan: '$query\uf8ff')
            .limit(5) // Get only a few suggestions
            .get();

        setState(() {
          _suggestions = snapshot.docs.map((doc) => doc['name'] as String).toList();
        });
      } catch (e) {
        print("Error fetching suggestions: $e");
      }
    });
  }

  // Perform search when user submits query
  Future<void> _searchServices(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _suggestions = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _suggestions = [];
    });

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('services')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThan: '$query\uf8ff')
          .get();

      setState(() {
        _searchResults = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
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
              onPressed: () => _searchServices(_searchController.text.trim()),
            ),
          ),
          onChanged: (value) => _fetchSuggestions(value.trim()),
          onSubmitted: (value) => _searchServices(value.trim()),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            // Show suggestions dynamically
            if (_searchController.text.isNotEmpty && _suggestions.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_suggestions[index]),
                    onTap: () {
                      _searchController.text = _suggestions[index];
                      _searchServices(_suggestions[index]);
                    },
                  );
                },
              ),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _searchResults.isEmpty
                      ? Center(child: Text('No vendors found.'))
                      : ListView.builder(
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
                              subtitle: Text(service['location'] ?? 'No location'),
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
