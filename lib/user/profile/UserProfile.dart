import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/user/loginmain.dart/loginpage.dart';
import 'package:wedweel/user/profile/Wishlist/Wishlist.dart';
import 'package:wedweel/user/profile/bookings/UserBooking.dart';
import 'package:wedweel/user/profile/editProfile/EditUserProfile.dart';
import 'package:wedweel/user/profile/privacyPolicy/PrivacyPolicyUser.dart';

class UserProfile extends StatefulWidget {
  UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Helper function to create a list tile with consistent styling
  Widget listContainer({required IconData iconleading, required String name}) {
    return ListTile(
      leading: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 178, 215, 181),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          iconleading,
          size: 20,
        ),
      ),
      title: Text(name),
      trailing: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 178, 215, 181),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
      ),
    );
  }

  bool isLoading = false; // Loading state for logout

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Profile Information',
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong'),
              );
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(
                child: Text('User data not found'),
              );
            } else {
              final data = snapshot.data!.data() as Map<String, dynamic>;
              final phone = data['phone'];
              final address = data['address'];

              return isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        SizedBox(height: 15.h),
                        Center(
                          child: CircleAvatar(
                            radius: 30,
                            child: ClipOval(
                              child: Image.asset(
                                'asset/wedlogo.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          data['fullname'],
                          style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 20,
                            color: Color.fromARGB(255, 21, 101, 93),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          height: 180.h,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 249, 255, 251),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditUserProfile(
                                        email: data['email'],
                                        fullname: data['fullname'],
                                        phone: phone ?? 'Phone Number',
                                        address: address ?? 'Address',
                                      ),
                                    ),
                                  );
                                },
                                child: listContainer(
                                  iconleading: Icons.person,
                                  name: "Edit Profile",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Wishlist(),
                                    ),
                                  );
                                },
                                child: listContainer(
                                  iconleading: Icons.favorite,
                                  name: 'Wishlist',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Userbooking(),
                                    ),
                                  );
                                },
                                child: listContainer(
                                  iconleading: Icons.view_kanban,
                                  name: 'My Bookings',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 180.h,
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 249, 255, 251),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              listContainer(
                                iconleading: Icons.paid,
                                name: 'Transactions',
                              ),
                              listContainer(
                                iconleading: Icons.info,
                                name: 'Complaints',
                              ),
                              listContainer(
                                iconleading: Icons.rate_review,
                                name: 'Share Feedback',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 249, 255, 251),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Privacypolicyuser(),
                                    ),
                                  );
                                },
                                child: listContainer(
                                  iconleading: Icons.security,
                                  name: 'Privacy Policy',
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // Check if the widget is still mounted before proceeding
                                  if (!mounted) return;

                                  setState(() {
                                    isLoading = true;
                                  });

                                  try {
                                    await FirebaseAuth.instance.signOut();

                                    // Check if the widget is still mounted before navigating
                                    if (mounted) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginUserPage()),
                                        (route) =>
                                            false, // Remove all routes from the stack
                                      );
                                    }
                                  } catch (e) {
                                    print('Error during logout: $e');

                                    // Check if the widget is still mounted before showing the SnackBar
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Failed to logout. Please try again.'),
                                        ),
                                      );
                                    }
                                  } finally {
                                    // Check if the widget is still mounted before calling setState
                                    if (mounted) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  }
                                },
                                child: listContainer(
                                  iconleading: Icons.logout,
                                  name: 'Logout',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            }
          },
        ),
      ),
    );
  }
}
