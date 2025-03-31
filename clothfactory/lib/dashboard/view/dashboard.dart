import 'package:clothfactory/cart/view/cart_screen.dart';
import 'package:clothfactory/home/view/home_screen.dart';
import 'package:flutter/material.dart';

import '../../home/view/categoryview.dart';
import '../../useraccount/view/account.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  int _currentIndex = 0;
  List<Widget> body = [
    Home(),
    Category(),
    CartScreen(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 5,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.category_outlined),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: 'cart',
            icon: Icon(Icons.shopping_cart),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.account_circle_outlined),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
