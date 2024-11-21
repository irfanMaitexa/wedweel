import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wedweel/admin/screen/ManageVendorDetails.dart';

import 'package:wedweel/admin/screen/adminHome.dart';
import 'package:wedweel/admin/screen/manageVendor.dart';
import 'package:wedweel/firebase_options.dart';
import 'package:wedweel/user/loginmain.dart/loginpage.dart';
import 'package:wedweel/user/loginmain.dart/signuppage.dart';
import 'package:wedweel/venders/screen/LoginVendor.dart';
import 'package:wedweel/venders/screen/SignUpVendor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: 'Login Demo',
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
   // debugShowCheckedModeBanner: false,
    home: //LoginUserPage(),
     //SignUpUserPage(),
    //AdminHome(),
    // Loginvendor(),
    // Signupvendor(),
   //Managevendor()
   Managevendordetails()
    
  ));
}
