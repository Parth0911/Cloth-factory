import 'package:flutter/material.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import 'accountinfo.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 20),
        title: const Text("Cloth Factory"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                DashboardController().signout(context);
              },
              child: const Icon(
                Icons.login_outlined,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: accountInfo(context),
    );
  }
}
