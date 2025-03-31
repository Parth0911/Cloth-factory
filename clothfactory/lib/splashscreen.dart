import 'package:clothfactory/authentication/view/login_Screen.dart';
import 'package:clothfactory/dashboard/view/dashboard.dart';
import 'package:clothfactory/utils/sharedprefrance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7)).then((value) => {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => const LoginScreen(),
          ))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/app_icon_splash/sp.png"),
              width: 300,
            ),
            Text(
              "Cloth Factory",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitSquareCircle(
              color: Colors.redAccent,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
