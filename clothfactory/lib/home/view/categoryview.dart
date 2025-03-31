import 'package:flutter/material.dart';

import 'home_item_display_widget.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            /* Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryProduct(
                    press: () {},
                    image: 'assets/images/product/fashion_4.png',
                    text: 'Children',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CategoryProduct(
                    press: () {},
                    image: 'assets/images/product/fashion_3.png',
                    text: 'Mens',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CategoryProduct(
                    press: () {},
                    image: 'assets/images/product/fashion_5.png',
                    text: 'Women',
                  ),
                ],
              ),
            ),*/
            HomePageDisplayItem(
              productListName: 'Man products',
              categoryName: "man",
            ),
            HomePageDisplayItem(
              productListName: 'Woman products',
              categoryName: "woman",
            ),
            HomePageDisplayItem(
              productListName: 'Children products',
              categoryName: "child",
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String image, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          child: Chip(
            backgroundColor: Colors.redAccent,
            label: Row(
              children: [
                Image.asset(
                  image,
                  height: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
