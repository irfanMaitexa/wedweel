import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wedweel/config.dart';

class LayerThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    return Container(
      height: 684,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 59,
            top: 119,
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
              top: 150,
              child: Container(
                width: 310,
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter Fullname',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          Positioned(
            left: 59,
            top: 219,
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
              top: 249,
              child: Container(
                width: 310,
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          Positioned(
            left: 59,
            top: 319,
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
              top: 349,
              child: Container(
                width: 310,
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          Positioned(
            top: 420,
            right: 60,
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
          Positioned(
            top: 478,
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
            top: 560,
            left: 59,
            right: 59,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins-Regular',
                      color: forgotPasswordText),
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins-Regular',
                      color: signInButton),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
