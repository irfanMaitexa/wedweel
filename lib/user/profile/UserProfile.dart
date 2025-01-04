import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  Widget listContainer({required IconData iconleading, required String name}) {
    return ListTile(
      leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 178, 215, 181),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            iconleading,
            size: 20,
          )),
      title: Text(name),
      trailing: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 178, 215, 181),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )),
    );
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'profile information',
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 21, 101, 93),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('waiting');
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('something went wrong'),
                );
              } else {
                final data = snapshot.data!.data();
                final phone = data!['phone'];
                final address = data['address'];

                return isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data!['fullname'],
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 20,
                                color: Color.fromARGB(255, 21, 101, 93),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 180,
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
                                              address: address ?? 'Address')),
                                    );
                                  },
                                  child: listContainer(
                                      iconleading: Icons.person,
                                      name: "Edit Profile"),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Wishlist()),
                                      );
                                    },
                                    child: listContainer(
                                        iconleading: Icons.favorite,
                                        name: 'Wishlist')),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Userbooking()),
                                    );
                                  },
                                  child: listContainer(
                                      iconleading: Icons.view_kanban,
                                      name: 'my Bookings'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 180,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 249, 255, 251),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                listContainer(
                                    iconleading: Icons.paid,
                                    name: 'Transactions'),
                                listContainer(
                                    iconleading: Icons.info,
                                    name: 'complaints'),
                                listContainer(
                                    iconleading: Icons.rate_review,
                                    name: 'Share feedback'),
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
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Privacypolicyuser()),
                                    );
                                  },
                                  child: listContainer(
                                      iconleading: Icons.security,
                                      name: 'Privacy Policy'),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    await FirebaseAuth.instance.signOut();
                                    if (context.mounted) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginUserPage()),
                                          (route) => false);
                                    }

                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                  child: listContainer(
                                      iconleading: Icons.logout,
                                      name: 'Logout'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
              }
            }),
      ),
    );
  }
}
