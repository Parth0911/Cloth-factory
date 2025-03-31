// ignore: file_names
import 'package:clothfactory/authentication/controller/login_auth.dart';
import 'package:clothfactory/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../dashboard/view/dashboard.dart';
import '../../utils/sharedprefrance.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAgreeTc = false;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/app_icon_splash/sp.png",
            fit: BoxFit.fill,
          ),
          Row(
            children: [
              Checkbox(
                  activeColor: ThemeColors.checkboxActiveColor,
                  value: isAgreeTc,
                  onChanged: (value) {
                    setState(() {
                      isAgreeTc = !isAgreeTc;
                    });
                  }),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: const Text(
                  "I agree The Terms&Condition of the application",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          _loading == true
              ? CircularProgressIndicator(
                  color: ThemeColors.primaryColor,
                )
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                      icon: const Icon(Icons.login_rounded),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColors.primaryColor),
                      onPressed: isAgreeTc == true
                          ? () async {
                              setState(() {
                                _loading = true;
                              });
                              bool isLogin = false;
                              isLogin = await signup(context);
                              if (isLogin == true) {
                                Shared_Prefrence.setBool(
                                    SharedPrefranceKeys.isLogin, true);
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Dashboard(),
                                  ),
                                );
                              }

                              setState(() {
                                _loading = false;
                              });
                            }
                          : null,
                      label: const Text('Login With Google')),
                )
        ],
      ),
    );
  }
}
