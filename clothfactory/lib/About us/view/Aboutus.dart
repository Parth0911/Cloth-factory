import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key? key}) : super(key: key);
  final productCategory = TextEditingController();
  final productDescription = TextEditingController();
  final productId = TextEditingController();
  final productName = TextEditingController();
  final productPrice = TextEditingController();
  final productImageLink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cloth Factory"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextFormField(
                controller: productId,
                decoration: const InputDecoration(
                    hintText: "Product Id", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productName,
                decoration: const InputDecoration(
                    hintText: "Product Name", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productCategory,
                decoration: const InputDecoration(
                    hintText: "Product Category", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productDescription,
                decoration: const InputDecoration(
                    hintText: "Product Description",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productPrice,
                decoration: const InputDecoration(
                    hintText: "Product Price", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productImageLink,
                decoration: const InputDecoration(
                    hintText: "Image Link", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('products');
                  collRef.add({
                    'Product_Category': productCategory.text,
                    'Product_Decription': productDescription.text,
                    'Product_Id': productId.text,
                    'Product_Name': productName.text,
                    'Product_image': productImageLink.text,
                    'Product_Price': productPrice.text,
                  });
                },
                child: Text('Add Product'),
              )
            ],
          ),
        ));
  }
}
