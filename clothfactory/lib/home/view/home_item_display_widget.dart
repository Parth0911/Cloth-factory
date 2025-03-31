import 'package:clothfactory/home/controller/homepagedisplayproductcontroller.dart';
import 'package:clothfactory/productdetail/productdetailscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'homepage_item_display.dart';

class HomePageDisplayItem extends StatefulWidget {
  HomePageDisplayItem({
    Key? key,
    required this.productListName,
    this.categoryName = "",
  }) : super(key: key);

  final String productListName, categoryName;

  @override
  State<HomePageDisplayItem> createState() => _HomePageDisplayItemState();
}

class _HomePageDisplayItemState extends State<HomePageDisplayItem> {
  Stream<QuerySnapshot>? _productsStream;
  List<String> likedProducts = [];

  void initState() {
    super.initState();
    fetchLikedProduct();
  }

  Future fetchLikedProduct() async {
    likedProducts = await HomePageProductController().fetchProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widget.categoryName == ""
        ? _productsStream = FirebaseFirestore.instance
            .collection('products')
            .orderBy("Product_Name", descending: false)
            .snapshots()
        : _productsStream = FirebaseFirestore.instance
            .collection('products')
            .where(
              "Product_Category",
              arrayContains: widget.categoryName,
            )
            .orderBy("Product_Name", descending: false)
            .snapshots();

    return Padding(
      padding: EdgeInsets.all(SizeConstant.appPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.productListName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _productsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.active) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.470,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> productData =
                            document.data()! as Map<String, dynamic>;

                        bool isLiked =
                            likedProducts.contains(productData["Product_Id"]);

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                      productData: productData),
                                ));
                          },
                          child: Stack(children: [
                            HomepageDisplayItem(
                              productImagePath: productData["Product_image"][0],
                              productName: productData["Product_Name"],
                              productPrice: productData["Product_Price"],
                              onTap: () async {
                                await HomePageProductController()
                                    .addProductToCart(context, productData);
                              },
                            ),
                            Positioned(
                              top: 10,
                              right: 0,
                              width: 45,
                              child: IconButton(
                                  onPressed: () async {
                                    HomePageProductController()
                                        .addOrRemoveFromLike(
                                            isLiked,
                                            likedProducts,
                                            productData["Product_Id"]);
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    isLiked == true
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_outlined,
                                    color: isLiked == true
                                        ? Colors.red
                                        : Colors.white,
                                  )),
                            )
                          ]),
                        );
                      }).toList(),
                    ));
              } else {
                return const SizedBox(
                  width: 0,
                  height: 0,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
