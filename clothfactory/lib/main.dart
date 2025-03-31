import 'package:clothfactory/dashboard/view/dashboard.dart';
import 'package:clothfactory/splashscreen.dart';
import 'package:clothfactory/utils/sharedprefrance.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'authentication/view/login_Screen.dart';
import "package:firebase_core/firebase_core.dart";

void main() async {
  // initializing the firebase app

  WidgetsFlutterBinding.ensureInitialized();
  Shared_Prefrence.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cloth Factory',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: LoaderOverlay(
          reverseDuration: const Duration(milliseconds: 250),
          duration: const Duration(milliseconds: 250),
          child: Shared_Prefrence.getBool(SharedPrefranceKeys.isLogin, false) ==
                  true
              ? const Dashboard()
              : const LoginScreen(),
        ));
  }
}
