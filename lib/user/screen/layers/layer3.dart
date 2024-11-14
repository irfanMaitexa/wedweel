import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wedweel/config.dart';
import 'package:wedweel/user/loginmain.dart/signuppage.dart';
import 'package:wedweel/user/servicesuser/AuthUserServices.dart';

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
                top: 119,
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
                  top: 150,
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
                top: 219,
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
                  top: 249,
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
                  right: 60,
                  top: 316,
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
                  top: 371,
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
                  top: 385,
                  child: Text(
                    'Remember Me',
                    style: TextStyle(
                        color: forgotPasswordText,
                        fontSize: 14,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500),
                  )),
              Positioned(
                  top: 375,
                  right: 60,
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        UserAuthServices().Signin(
                            email: email.text,
                            password: password.text,
                            context: context);
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
                  top: 442,
                  left: 59,
                  child: Container(
                    height: 0.5,
                    width: 310,
                    color: inputBorder,
                  )),
              Positioned(
                top: 470,
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
