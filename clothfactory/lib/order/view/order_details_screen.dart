import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen(
      {Key? key,
      this.productList,
      required this.paymentId,
      required this.orderDate,
      required this.orderId,
      required this.amount})
      : super(key: key);
  final productList;
  final String paymentId, orderDate, orderId;
  final amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: productList.length,
          itemBuilder: (context, index) => ListTile(
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: productList[index]["Product_image"][0],
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: Text(productList[index]["Product_Name"]),
            subtitle: Text("Rs." + productList[index]["Product_Price"]),
            trailing: Text("x" + productList[index]["count"].toString()),
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total"),
              Text("Rs.$amount"),
            ],
          ),
        )
      ]),
    );
  }
}
