import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomFunction {
  String getCurrentTimeInInt() {
    String passDate = "";
    passDate = DateTime.now().toString();
    passDate = passDate.replaceAll(RegExp('[^0-9]'), '');
    return passDate;
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
