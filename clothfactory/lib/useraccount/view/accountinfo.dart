import 'package:clothfactory/About%20us/view/Aboutus.dart';
import 'package:clothfactory/liked_products/view/liked_products_screen.dart';
import 'package:clothfactory/order/view/order_list_screen.dart';
import 'package:clothfactory/privacy_policy/view/privacy_policy.dart';
import 'package:clothfactory/terms_and_condition/view/terms_condition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Accountinfo extends StatefulWidget {
  const Accountinfo({Key? key}) : super(key: key);

  @override
  State<Accountinfo> createState() => _AccountinfoState();
}

class _AccountinfoState extends State<Accountinfo> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

ListView accountInfo(context) {
  return ListView(
    children: [
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 200,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 90,
              width: 90,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(70),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  FirebaseAuth.instance.currentUser?.photoURL!.split(" ")[0] ??
                      "assets/images/avtar.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              FirebaseAuth.instance.currentUser?.displayName!.split(" ")[0] ??
                  "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              FirebaseAuth.instance.currentUser?.email!.split(" ")[0] ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 50,
          ),
          ListTile(
            leading: const Icon(Icons.grading_outlined),
            trailing: const Icon(Icons.chevron_right),
            title: const Text("Your Order"),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OrderListScreen())),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LikedProductsScreen(),
            )),
            title: Text("Favorites"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TermsAndCondition(),
              ));
            },
            leading: const Icon(Icons.gavel),
            title: const Text("Terms & conditions"),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PrivacyPolicyScreen(),
              ));
            },
            leading: const Icon(Icons.policy_sharp),
            title: const Text("Privacy policy"),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AboutUs(),
              ));
            },
            leading: Icon(Icons.admin_panel_settings_sharp),
            title: Text("Admin Panel"),
          ),
        ],
      )
    ],
  );
}
