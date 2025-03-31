// creating firebase instance
// ignore_for_file: use_build_context_synchronously
import 'package:clothfactory/utils/dialogBox.dart';
import 'package:clothfactory/utils/firebase_constant.dart';
import 'package:clothfactory/utils/firebase_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/logged_in_user_model.dart';

Future<bool> signup(BuildContext context) async {
  bool isSuccess = false;

  try {
    isSuccess = await FirebaseMain().googleLogin();
    if (isSuccess == true) {
      return isSuccess;
    }
  } catch (error) {
    if (error == FirebaseCollections.noInternetString) {
      CustomDialoge().dialog(context, () {
        Navigator.pop(context);
        signup(context);
      });
    }
  }
  return isSuccess;
}
