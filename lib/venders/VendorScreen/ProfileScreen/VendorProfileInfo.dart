import 'package:flutter/material.dart';

class Vendorprofileinfo extends StatelessWidget {
  Widget listprofileinfo(
      {String? listtitle,
      IconData? trailingicon,
      String leadingtitle = " ",
      Color? TextColor}) {
    return ListTile(
      leading: Text(
        leadingtitle!,
        style: TextStyle(fontSize: 16),
      ),
      title: Text(
        listtitle!,
        style: TextStyle(color: TextColor),
      ),
      trailing: Icon(
        trailingicon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text("Profile",
        //     style: TextStyle(
        //         fontFamily: 'Poppins-Regular',
        //         fontSize: 23,
        //         color: Color.fromARGB(255, 21, 101, 93),
        //         fontWeight: FontWeight.w500)),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.only(left: 29, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              height: 20,
            ),
            Center(
              child: Text('Change profile ',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins-Regular',
                      color: Colors.teal)),
            ),
            Divider(
              height: 50,
              color: Colors.grey,
              // indent: 12,
              // endIndent: 12,
            ),
            Text("Profile Information",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(
              height: 25,
            ),
            listprofileinfo(
              leadingtitle: "Name            ",
              listtitle: "WedCom",
              trailingicon: Icons.arrow_forward_ios_rounded,
            ),
            listprofileinfo(
              leadingtitle: "UserName     ",
              listtitle: "Wed_com_1",
              trailingicon: Icons.arrow_forward_ios_rounded,
            ),
            Divider(
              height: 60,
              color: Colors.grey,
            ),
            Text("Personal Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(
              height: 15,
            ),
            listprofileinfo(
                leadingtitle: "User ID       ",
                listtitle: "45839",
                trailingicon: Icons.copy_all_rounded),
            listprofileinfo(
              leadingtitle: "Email         ",
              listtitle: "Wedcom@gmailcom",
              trailingicon: Icons.email_outlined,
            ),
            listprofileinfo(
              leadingtitle: "Phone Number   ",
              listtitle: "+91 1234567890",
              trailingicon: Icons.phone_android_rounded,
            )
          ],
        ),
      ),
    );
  }
}
