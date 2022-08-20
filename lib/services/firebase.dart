import 'package:bancvest_app/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseService {
  signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: e.message ?? 'user not found',
          backgroundColor: CustomColors.customRed,
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: e.message ?? 'wrong password',
          backgroundColor: CustomColors.customRed,
        );
      }
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
