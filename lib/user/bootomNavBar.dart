import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:wedweel/user/UserFirst.dart';
import 'package:wedweel/user/UserHome/VendoritemsUser.dart';
import 'package:wedweel/user/profile/UserProfile.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Userfirst(
      check: true,
    ),
    Vendoritemsuser(),
    UserProfile(),
  ];

  // Function to switch pages based on the selected index
  List<Widget> _buildScreens() {
    return [
      _widgetOptions[0],
      _widgetOptions[1],
      _widgetOptions[2],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        context,
        controller: PersistentTabController(initialIndex: _selectedIndex),
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
