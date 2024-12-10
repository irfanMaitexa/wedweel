import 'package:flutter/material.dart';

class Vendorprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
            style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 23,
                color: Color.fromARGB(255, 21, 101, 93),
                fontWeight: FontWeight.w500)),
      ),
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
            Row(
              children: [
                Text("Name"),
                SizedBox(
                  width: 110,
                ),
                Text("WedCom"),
                SizedBox(
                  width: 90,
                ),
                Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Username"),
                SizedBox(
                  width: 80,
                ),
                Text("Wed_com_1"),
                SizedBox(
                  width: 65,
                ),
                Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
            Divider(
              height: 60,
              color: Colors.grey,
              // indent: 15,
              // endIndent: 15,
            ),
            Text("Personal Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text("User ID"),
                SizedBox(
                  width: 76,
                ),
                Text("45839"),
                SizedBox(
                  width: 140,
                ),
                Icon(Icons.copy_all_rounded)
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Text("Email"),
                SizedBox(
                  width: 76,
                ),
                Text("Wedcom@gmailcom"),
                SizedBox(
                  width: 40,
                ),
                Icon(Icons.email_outlined)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Phone Number"),
                SizedBox(
                  width: 24,
                ),
                Text("+91 9876543210"),
                SizedBox(
                  width: 66,
                ),
                Icon(Icons.phone_android_outlined)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
