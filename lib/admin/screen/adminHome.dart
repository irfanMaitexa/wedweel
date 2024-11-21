import 'package:flutter/material.dart';
import 'package:wedweel/admin/screen/manageVendor.dart';
import 'package:wedweel/config.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Home',
          style: TextStyle(
            fontSize: 21,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 21, 101, 93),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/primaryBg.png'), fit: BoxFit.cover),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 13,
          crossAxisSpacing: 14,
          childAspectRatio: .8,
          padding: const EdgeInsets.all(12),
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 232, 245, 233),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Manage Profile',
                  style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 232, 245, 233),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Manage User',
                  style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Poppins-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 232, 245, 233),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Managevendor(),
                      ));
                },
                child: const Text(
                  'Manage Vendor',
                  style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Poppins-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 232, 245, 233),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'View Review',
                  style: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'Poppins-Medium',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 232, 245, 233),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Manage blogs',
                  style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Poppins-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 232, 245, 233),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Manage\n Complaint',
                style: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'Poppins-Medium',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
