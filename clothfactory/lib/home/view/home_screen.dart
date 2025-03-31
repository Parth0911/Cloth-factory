import 'package:clothfactory/home/view/categoryview.dart';
import 'package:clothfactory/search/view/search_screen.dart';
import 'package:clothfactory/utils/size_constant.dart';
import 'package:flutter/material.dart';
import 'bannerwidget.dart';
import 'home_item_display_widget.dart';
import 'homepage_item_display.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
              },
              icon: Icon(Icons.search))
        ],
        elevation: 1,
        title: const Text('Cloth Factory'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            BannerCrousel(),
            HomePageDisplayItem(
              productListName: 'All products',
            ),
          ],
        ),
      ),
    );
  }
}
