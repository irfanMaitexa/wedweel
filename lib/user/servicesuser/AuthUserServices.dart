import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuthServices {
  final firebaseauth = FirebaseAuth.instance;
  final firebasestore = FirebaseFirestore.instance;
  void Signin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      print(email);
      print(password);
      await firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Successfull')));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code.toString())));
    }
  }

  void SignUp(
      {required String email,
      required String password,
      required String fullname,
      required BuildContext context}) async {
    try {
      var user = await firebaseauth.createUserWithEmailAndPassword(
          email: email, password: password);

      await firebasestore
          .collection('user')
          .doc(user.user!.uid)
          .set({'email': email, 'password': password, 'fullname': fullname});

      print(user.user!.uid);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign Up Successfull')));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code.toString())));
    }
  }
}
