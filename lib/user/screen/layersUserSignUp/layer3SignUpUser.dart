import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/config.dart';
import 'package:wedweel/user/loginmain.dart/loginpage.dart';

class Layer3signupuser extends StatefulWidget {
  Layer3signupuser({super.key});
  @override
  State<Layer3signupuser> createState() => _LayerThree();
}

class _LayerThree extends State<Layer3signupuser> {
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController(); // Add full name controller
  bool isLoad = false;

  String? validateEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    return emailRegExp.hasMatch(email) ? null : 'Enter a valid email';
  }

  String? validatePassword(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return passwordRegExp.hasMatch(password)
        ? null
        : 'Password must be at least 8 characters, include an uppercase letter, a number, and a special character.';
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    return SafeArea(
      child: Form(
        key: _formKey,
        child: Container(
          height: 1.sh, // Full screen height
          width: 1.sw, // Full screen width
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 59.w,
                top: 169.h,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 59.w,
                top: 200.h,
                child: Container(
                  width: 310.w,
                  child: TextFormField(
                    controller: email,
                    validator: (value) => validateEmail(value!),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(color: hintText),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 59.w,
                top: 265.h,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 59.w,
                top: 300.h,
                child: Container(
                  width: 310.w,
                  child: TextFormField(
                    obscureText: obscureText,
                    controller: password,
                    validator: (value) => validatePassword(value!),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                      border: UnderlineInputBorder(),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(color: hintText),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 59.w,
                top: 359.h,
                child: Text(
                  'Fullname',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 59.w,
                top: 400.h,
                child: Container(
                  width: 310.w,
                  child: TextFormField(
                    controller: fullName, // Use fullName controller
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(color: hintText),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 130.h,
                right: 26.w,
                child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoad = true;
                      });
                      await _registerUser(context, email.text.trim(),
                          password.text.trim(), fullName.text.trim());
                      setState(() {
                        isLoad = false;
                      });
                    }
                  },
                  child: Container(
                    width: 99.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: signInButton,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.h,
                left: 59.w,
                right: 59.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'Poppins-Regular',
                          color: forgotPasswordText),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginUserPage()),
                        );
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'Poppins-Regular',
                            color: signInButton),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser(
      BuildContext context, String email, String password, String fullName) async {
    try {
      // Register the user with Firebase Authentication
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save additional user details to Firestore
      await FirebaseFirestore.instance
          .collection('user')
          .doc(userCredential.user?.uid)
          .set({
        'email': email,
        'fullName': fullName,
        'uid': userCredential.user?.uid,
      });

      // Navigate to the CompleteProfilePage
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => CompleteProfilePage(userId: userCredential.user!.uid),
      //   ),
      // );
       Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginUserPage(),
      ),
    );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to register: $e'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

