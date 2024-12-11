import 'package:flutter/material.dart';
import 'package:wedweel/venders/VendorScreen/ProfileScreen/EditProfileVendor.dart';
import 'package:wedweel/venders/VendorScreen/ProfileScreen/VendorProfileInfo.dart';

class Vendorprofile extends StatelessWidget {
  Widget listprofile(
      {String? listtitle,
      IconData? listicon,
      String leadingtitle = " ",
      Color? TextColor}) {
    return ListTile(
      leading: Icon(
        listicon,
        color: Colors.blue,
      ),
      title: Text(
        listtitle!,
        style: TextStyle(color: TextColor),
      ),
      // trailing: Icon(listicon, color: Colors.blue),
      trailing: Text(
        leadingtitle,
        style: TextStyle(color: Color.fromARGB(255, 21, 101, 93), fontSize: 13),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile",
            style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 23,
                color: Color.fromARGB(255, 21, 101, 93),
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: CircleAvatar(
                radius: 45,
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
              "  Wedcom Events",
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 21, 101, 93)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Editprofilevendor()));
              },
              child: Text(
                "Edit Profile",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 237, 250, 244),
                minimumSize: (Size(150, 35)),
                shape: StadiumBorder(),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Vendorprofileinfo()));
              },
              child: listprofile(
                  listtitle: "information",
                  listicon: Icons.info,
                  leadingtitle: ">"),
            ),
            listprofile(
                listicon: Icons.translate,
                leadingtitle: "English",
                listtitle: "Language"),
            listprofile(
                listicon: Icons.support_agent_outlined,
                listtitle: "Help & Support"),
            listprofile(
                listtitle: "Privacy Policy",
                listicon: Icons.privacy_tip_outlined),
            listprofile(
                listtitle: "Logout",
                listicon: Icons.logout_outlined,
                TextColor: Colors.red)
          ],
        ),
      ),
    );
  }
}
