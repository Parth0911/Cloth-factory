import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../home/controller/homepagedisplayproductcontroller.dart';
import '../utils/size_constant.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.productData})
      : super(key: key);
  final Map<String, dynamic> productData;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedImage = 0;
  String selectedImageLink = "";

  @override
  void initState() {
    super.initState();
    if (widget.productData["Product_image"] != null &&
        widget.productData["Product_image"].length > 0) {
      selectedImageLink = widget.productData["Product_image"][0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left, color: Colors.black),
        ),
        title: Text(
          widget.productData["Product_Name"],
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConstant.appPadding),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: selectedImageLink,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.productData["Product_image"].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          selectedImage = index;
                          selectedImageLink =
                              widget.productData["Product_image"][index];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: selectedImage == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Card(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                width: 50,
                                height: 90,
                                child: CachedNetworkImage(
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.fill,
                                  imageUrl: widget.productData["Product_image"]
                                      [index],
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        "Name :",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.productData['Product_Name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        "Price :",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Rs.${widget.productData['Product_Price']}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Details :",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          widget.productData['Product_Decription'],
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "More Details :",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          widget.productData['Product_Id'],
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                HomePageProductController()
                    .addProductToCart(context, widget.productData);
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
