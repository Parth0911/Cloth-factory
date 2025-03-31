import 'package:clothfactory/authentication/view/login_Screen.dart';
import 'package:clothfactory/utils/CustomDialog.dart';
import 'package:clothfactory/utils/firebase_main.dart';
import 'package:clothfactory/utils/sharedprefrance.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/dialogBox.dart';
import '../../utils/firebase_constant.dart';

class DashboardController {
  Future<void> signout(BuildContext context) async {
    bool isSuccess = false;
    try {
      isSuccess = await FirebaseMain().googleLogout();
      if (isSuccess) {
        Shared_Prefrence.setBool(SharedPrefranceKeys.isLogin, false);
        Shared_Prefrence.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
      }
    } catch (error) {
      if (error == FirebaseCollections.noInternetString) {
        CustomDialog().dialog(
            context: context,
            onPress: () {
              Navigator.pop(context);
              signout(context);
            },
            isCancelAvailable: true,
            successButtonName: "Retry",
            title: "No internet connection",
            content: "check your internet connectivity");
      }
    }
  }
}
