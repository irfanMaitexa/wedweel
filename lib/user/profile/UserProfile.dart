import 'package:flutter/material.dart';
import 'package:wedweel/user/profile/Wishlist/Wishlist.dart';
import 'package:wedweel/user/profile/editProfile/EditUserProfile.dart';

class UserProfile extends StatelessWidget {
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
        body: Column(
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
              "mufeeda",
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
                            builder: (context) => EditUserProfile()),
                      );
                    },
                    child: listContainer(
                        iconleading: Icons.person, name: "Edit Profile"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Wishlist()),
                      );
                    },
                    child: listContainer(iconleading: Icons.favorite, name: 'Wishlist')),
                  listContainer(
                      iconleading: Icons.view_kanban, name: 'my Bookings'),
                ],
              ),
            ),
            Container(
              height: 180,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 255, 251),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  listContainer(iconleading: Icons.paid, name: 'Transactions'),
                  listContainer(iconleading: Icons.info, name: 'complaints'),
                  listContainer(
                      iconleading: Icons.rate_review, name: 'Share feedback'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 249, 255, 251) ,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    listContainer(
                        iconleading: Icons.security, name: 'Privacy Policy'),
                    listContainer(iconleading: Icons.logout, name: 'Logout'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
