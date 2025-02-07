import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:wedweel/user/UserFirst.dart';
import 'package:wedweel/user/UserHome/VendoritemsUser.dart';
import 'package:wedweel/user/profile/UserProfile.dart';
import 'package:wedweel/user/loginmain.dart/loginpage.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  // List of screens for the bottom navigation bar
  List<Widget> _buildScreens() {
    return [
      Userfirst(check: true),
      Vendoritemsuser(),
      UserProfile(logout: _handleLogout), // Pass logout function
    ];
  }

  // Logout function
  Future<void> _handleLogout() async {
    try {
      await FirebaseAuth.instance.signOut();

      // Ensure the widget is still mounted before navigating
      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginUserPage()),
        (route) => false, // Clear all previous routes
      );
    } catch (e) {
      print('Error during logout: $e');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to logout. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: 'Home',
            activeColorPrimary: Color.fromARGB(255, 21, 101, 93),
            inactiveColorPrimary: Colors.black,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.storefront_outlined),
            title: 'Vendor',
            activeColorPrimary: Color.fromARGB(255, 21, 101, 93),
            inactiveColorPrimary: Colors.black,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.person),
            title: 'Profile',
            activeColorPrimary: Color.fromARGB(255, 21, 101, 93),
            inactiveColorPrimary: Colors.black,
          ),
        ],
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }
}
