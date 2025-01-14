import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wedweel/config.dart';
import 'package:wedweel/user/loginmain.dart/signuppage.dart';
import 'package:wedweel/user/servicesuser/AuthUserServices.dart';
import 'package:wedweel/venders/VendorScreen/vendorHome.dart';

class LayerThree extends StatefulWidget {
  LayerThree({super.key});
  @override
  State<LayerThree> createState() => _LayerThree();
}

class _LayerThree extends State<LayerThree> {
  final _formKey = GlobalKey<FormState>();
  String? validateEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    bool isvalid = emailRegExp.hasMatch(email);
    if (isvalid) {
      return null;
    } else {
      return 'Enter a valid email';
    }
  }

  String? validatePassword(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    bool isvalid = passwordRegExp.hasMatch(password);

    return isvalid ? null : 'Enter a valid password';
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isload = false;
  Widget build(BuildContext context) {
    bool isChecked = false;
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Container(
          height: 684,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 59,
                top: 169,
                child: Text(
                  'Username',
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                  left: 59,
                  top: 200,
                  child: Container(
                    width: 310,
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        return validateEmail(value!);
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Enter User ID or Email',
                        hintStyle: TextStyle(color: hintText),
                      ),
                    ),
                  )),
              Positioned(
                left: 59,
                top: 265,
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                  left: 59,
                  top: 300,
                  child: Container(
                    width: 310,
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        return validatePassword(value!);
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: hintText),
                      ),
                    ),
                  )),
              Positioned(
                  right: 30,
                  top: 360,
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: forgotPasswordText,
                        fontSize: 16,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w600),
                  )),
              Positioned(
                  left: 46,
                  bottom: 146,
                  child: Checkbox(
                    checkColor: Colors.black,
                    activeColor: checkbox,
                    value: isChecked,
                    onChanged: (bool? value) {
                      isChecked = value!;
                    },
                  )),
              Positioned(
                  left: 87,
                  bottom: 160,
                  child: Text(
                    'Remember Me',
                    style: TextStyle(
                        color: forgotPasswordText,
                        fontSize: 14,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500),
                  )),
              Positioned(
                  bottom: 160,
                  right: 60,
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isload = true;
                        });
                        await _checkVerificationStatus(
                            context, email.text.trim(), password.text.trim());

                        setState(() {
                          isload = false;
                        });
                      }
                    },
                    child: Container(
                      width: 99,
                      height: 35,
                      decoration: BoxDecoration(
                        color: signInButton,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          'Sign In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 140,
                  left: 59,
                  child: Container(
                    height: 0.5,
                    width: 310,
                    color: inputBorder,
                  )),
              Positioned(
                bottom: 50,
                left: 120,
                right: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 59,
                      height: 58,
                      decoration: BoxDecoration(
                          border: Border.all(color: signInBox),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Image.asset(
                        'asset/icon_google.png',
                        width: 20,
                        height: 21,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins-Regular',
                          color: hintText),
                    ),
                    Container(
                      width: 59,
                      height: 58,
                      decoration: BoxDecoration(
                          border: Border.all(color: signInBox),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Image.asset(
                        'asset/icon_apple.png',
                        width: 20,
                        height: 21,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 59,
                right: 59,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Poppins-Regular',
                          color: forgotPasswordText),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpUserPage()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 17,
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
}

Future<void> _checkVerificationStatus(
    context, String email, String password) async {
  final userCreaditional = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  final vendorData = await FirebaseFirestore.instance
      .collection('vendor')
      .doc(userCreaditional.user?.uid)
      .get();

  print(userCreaditional.user?.uid);
  print('9999999999999999999999999999999999');

  if (vendorData.exists && userCreaditional.user != null) {
    final verificationStatus = vendorData.get('IsAdminApproved');
    if (verificationStatus == false) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Verification Pending'),
            content: Text(
                'Your verification is pending. Please wait for the admin to approve your account.'),
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
    } else {

      
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => VendorHome()),(route) => false,
      );
    }
  } else {
   
    // Handle the case where the vendor data does not exist
  }
}
