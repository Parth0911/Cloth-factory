import 'package:clothfactory/order/view/order_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18)),
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('orderHistory')
                  .where("uid",
                      isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.data!.docs != null &&
                    snapshot.data!.docs.isNotEmpty) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.315,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> productData =
                              document.data()! as Map<String, dynamic>;
                          DateTime convertTimeStampToDate =
                              productData["created_At"].toDate();
                          var dt = DateTime.fromMillisecondsSinceEpoch(
                              convertTimeStampToDate.millisecond);
                          var d12 =
                              DateFormat('MM/dd/yyyy, hh:mm a').format(dt);

                          DateTime date = DateTime.parse(
                              productData["created_At"].toDate().toString());
                          String orderDate =
                              DateFormat('dd-MMM-yyy h:mm a').format(date);

                          return ListTile(
                            title: Text(orderDate),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderDetailScreen(
                                  paymentId: productData["payment_Id"],
                                  orderDate: orderDate,
                                  orderId: productData["order_id"],
                                  productList: productData["product_list"],
                                  amount: productData["order_Amount"],
                                ),
                              ));
                            },
                          );
                        }).toList(),
                      ));
                } else {
                  return Center(
                      child: Center(
                          child: Image.asset("assets/images/product/img.png")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
