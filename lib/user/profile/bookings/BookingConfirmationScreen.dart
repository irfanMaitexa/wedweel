import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingConfirmationScreen extends StatefulWidget {
  final String vendorId;

  const BookingConfirmationScreen({Key? key, required this.vendorId})
      : super(key: key);

  @override
  _BookingConfirmationScreenState createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  Map<String, dynamic>? vendorData;
  bool _isLoading = true; // To track loading state
  String _errorMessage = ''; // To store error messages

  @override
  void initState() {
    super.initState();
    _fetchVendorDetails();
  }

  Future<void> _fetchVendorDetails() async {
    try {
      // Fetch documents where 'vendor_id' matches the provided vendorId
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('services')
          .where('vendor_id', isEqualTo: widget.vendorId)
          .get();

      // Check if any documents were returned
      if (querySnapshot.docs.isNotEmpty) {
        // Use the first document (assuming there's only one matching document)
        DocumentSnapshot vendorSnapshot = querySnapshot.docs.first;
        setState(() {
          vendorData = vendorSnapshot.data() as Map<String, dynamic>;
          _isLoading = false; // Data fetched, stop loading
        });
      } else {
        setState(() {
          _errorMessage = "Vendor not found.";
          _isLoading = false; // No data found, stop loading
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Error fetching vendor details: $e";
        _isLoading = false; // Error occurred, stop loading
      });
      print("Error fetching vendor details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Confirmed"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage)) // Show error message
              : Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your booking has been confirmed!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      if (vendorData!["image"] != null)
                        Center(
                          child: Image.network(
                            vendorData!['image'],
                            height: 150,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error, size: 150, color: Colors.red); // Fallback for image loading errors
                            },
                          ),
                        ),
                      SizedBox(height: 10),
                      Text(
                        "Vendor: ${vendorData!['name'] ?? 'N/A'}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Location: ${vendorData!["location"] ?? 'N/A'}",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Go back to the previous screen
                          },
                          child: Text("Back to Home"),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}