import 'package:clothfactory/productdetail/productdetailscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Stream<QuerySnapshot>? streamQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Search",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    streamQuery = FirebaseFirestore.instance
                        .collection('products')
                        .where('product_name', isGreaterThanOrEqualTo: value)
                        .where('product_name',
                            isLessThanOrEqualTo: "$value\uf7ff")
                        .snapshots();
                    setState(() {});
                  } else {
                    streamQuery = null;
                    setState(() {});
                  }
                }),
            StreamBuilder<QuerySnapshot>(
              stream: streamQuery,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.active) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.315,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> productData =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                              title: Text(productData["Product_Name"]),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                        productData: productData)));
                              });
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
      ),
    );
  }
}
