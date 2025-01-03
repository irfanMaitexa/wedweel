import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wedweel/admin/LoginScreen/LoginAdmin.dart';
import 'package:wedweel/admin/screen/BlogDetails.dart';
import 'package:wedweel/admin/screen/ManageBlogs.dart';
import 'package:wedweel/admin/screen/ManageCompliant.dart';
import 'package:wedweel/admin/screen/ManageProfile.dart';
import 'package:wedweel/admin/screen/ManageReview.dart';
import 'package:wedweel/admin/screen/ManageUser.dart';
import 'package:wedweel/admin/screen/ManageVendorDetails.dart';

import 'package:wedweel/admin/screen/adminHome.dart';

import 'package:wedweel/admin/screen/manageVendor.dart';
import 'package:wedweel/firebase_options.dart';
import 'package:wedweel/user/UserBlogs/UserBlogs.dart';
import 'package:wedweel/user/UserFirst.dart';
import 'package:wedweel/user/UserHome/VendorList.dart';
import 'package:wedweel/user/UserHome/VendoritemsUser.dart';
import 'package:wedweel/user/VendorMainDetails.dart';
import 'package:wedweel/user/Venue/Venue.dart';
import 'package:wedweel/user/bootomNavBar.dart';

import 'package:wedweel/user/loginmain.dart/loginpage.dart';
import 'package:wedweel/user/loginmain.dart/signuppage.dart';
import 'package:wedweel/user/profile/UserProfile.dart';
import 'package:wedweel/user/profile/Wishlist/Wishlist.dart';
import 'package:wedweel/user/profile/bookings/UserBooking.dart';
import 'package:wedweel/user/profile/editProfile/EditUserProfile.dart';
import 'package:wedweel/user/profile/privacyPolicy/PrivacyPolicyUser.dart';
import 'package:wedweel/user/userphotography/photographyVendor.dart';
import 'package:wedweel/venders/VendorScreen/ProfileScreen/EditProfileVendor.dart';
import 'package:wedweel/venders/VendorScreen/ProfileScreen/PolicyProfileVendor.dart';
import 'package:wedweel/venders/VendorScreen/ProfileScreen/VendorProfileInfo.dart';
import 'package:wedweel/venders/VendorScreen/ReviewScreen/VendorReviewScreen.dart';

import 'package:wedweel/venders/VendorScreen/ServiceScreen/ServiceFirstScreenVendor.dart';
import 'package:wedweel/venders/VendorScreen/ServiceScreen/AddServiceVendor.dart';
import 'package:wedweel/venders/VendorScreen/ProfileScreen/VendorProfile.dart';

import 'package:wedweel/venders/VendorScreen/vendorHome.dart';
import 'package:wedweel/venders/screen/BookingScreen/BookingVendor.dart';
import 'package:wedweel/venders/screen/BookingScreen/FirstScreenBooking.dart';
import 'package:wedweel/venders/screen/BookingScreen/PaymentVendor.dart';

import 'package:wedweel/venders/screen/LoginVendor.dart';
import 'package:wedweel/venders/screen/SignUpVendor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      // debugShowCheckedModeBanner: false,
      home:   LoginUserPage(),
          //SignUpUserPage(),
          // AdminHome(),
          // Loginvendor(),
          // Signupvendor(),
          //Managevendor()
          //Managevendordetails(),
          //Manageuser()
          //Managereview(),
          //Managecompliant()
          //LoginAdminPage()
          //Manageprofile()
          //Manageblogs()
          // Blogdetails()
          // VendorHome()
          //  ServiceVendor()
          //  ServiceFirstScreen()
          // Addservicevendor()

          // Vendorprofile()
          //Vendorprofileinfo()
          // Editprofilevendor()
          //PolicyProfileVendor()
          //VendorReviewScreen()
          //FirstScreenBooking()
          //Bookingvendor()
          // Paymentvendor(),

          // Userfirst()
          //  Userblogs()
          //Vendorlist()
          //BottomNavBar()
      //Vendoritemsuser()
      //Photographyvendor()
      //Venue()
      //EditUserProfile()
      //Wishlist()
      // Userbooking()
      //Privacypolicyuser()

      ));
}
