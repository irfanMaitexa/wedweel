import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wedweel/config.dart';
import 'package:wedweel/user/loginmain.dart/loginpage.dart';
import 'package:wedweel/user/servicesuser/AuthUserServices.dart';
import 'package:wedweel/venders/screen/SignUpsecondPage.dart';

class LayerThree extends StatefulWidget {
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
  TextEditingController fullname = TextEditingController();
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
                top: 149,
                child: Text(
                  'Fullname',
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                  left: 59,
                  top: 179,
                  child: Container(
                    width: 310,
                    child: TextField(
                      controller: fullname,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Enter Fullname',
                        hintStyle: TextStyle(color: hintText),
                      ),
                    ),
                  )),
              Positioned(
                left: 59,
                top: 252,
                child: Text(
                  'Email',
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                  left: 59,
                  top: 285,
                  child: Container(
                    width: 310,
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        return validateEmail(value!);
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(color: hintText),
                      ),
                    ),
                  )),
              Positioned(
                left: 59,
                bottom: 265,
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
                  bottom: 220,
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
                bottom: 160,
                right: 33,
                child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Signupsecondpage()),
                      );
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
                    child: isload
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins-Medium',
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                  ),
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
                      'Already have an account? ',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins-Medium',
                          color: forgotPasswordText),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In',
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
