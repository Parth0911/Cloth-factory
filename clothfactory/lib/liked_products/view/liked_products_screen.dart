import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothfactory/productdetail/productdetailscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LikedProductsScreen extends StatefulWidget {
  const LikedProductsScreen({Key? key}) : super(key: key);

  @override
  State<LikedProductsScreen> createState() => _LikedProductsScreenState();
}

//
// class _LikedProductsScreenState extends State<LikedProductsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Favorite items",
//             style:
//                 Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18)),
//         backgroundColor: Colors.red,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.chevron_left)),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('users')
//             .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text('Something went wrong');
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (snapshot.data!.docs != null && snapshot.data!.docs.isNotEmpty) {
//             Map userData = snapshot.data!.docs.first.data();
//             List likedProducts = [];
//             likedProducts = userData["liked_products"];
//
//             if (likedProducts.length < 0) {
//               return Column(
//                 children: [
//                   StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection('products')
//                         .where("Product_Id", whereIn: likedProducts)
//                         .snapshots(),
//                     builder: (BuildContext context,
//                         AsyncSnapshot<QuerySnapshot> snapshot) {
//                       if (snapshot.hasError) {
//                         return const Text('Something went wrong');
//                       }
//
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//
//                       if (snapshot.data!.docs != null &&
//                           snapshot.data!.docs.isNotEmpty) {
//                         return SizedBox(
//                             height: MediaQuery.of(context).size.height - 500,
//                             width: MediaQuery.of(context).size.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 15),
//                               child: ListView(
//                                 scrollDirection: Axis.vertical,
//                                 children: snapshot.data!.docs
//                                     .map((DocumentSnapshot document) {
//                                   Map<String, dynamic> productData =
//                                       document.data()! as Map<String, dynamic>;
//                                   return ListTile(
//                                     leading: ClipRRect(
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(20)),
//                                       child: CachedNetworkImage(
//                                         imageUrl: document["Product_image"][0],
//                                         placeholder: (context, url) =>
//                                             const CircularProgressIndicator(),
//                                         errorWidget: (context, url, error) =>
//                                             const Icon(Icons.error),
//                                       ),
//                                     ),
//                                     title: Row(
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             document["Product_Name"],
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     onTap: () {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   ProductDetailScreen(
//                                                       productData:
//                                                           productData)));
//                                     },
//                                   );
//                                 }).toList(),
//                               ),
//                             ));
//                       } else {
//                         return Center(
//                           child: Text("no product found"),
//                         );
//                       } //else
//                     },
//                   ),
//                 ],
//               );
//             } else {
//               return Center(
//                 child: Text("no product"),
//               );
//             }
//
//             // return Column(
//             //   children: [
//             //     StreamBuilder<QuerySnapshot>(
//             //       stream: FirebaseFirestore.instance
//             //           .collection('products')
//             //           .where("Product_Id", whereIn: likedProducts)
//             //           .snapshots(),
//             //       builder: (BuildContext context,
//             //           AsyncSnapshot<QuerySnapshot> snapshot) {
//             //         if (snapshot.hasError) {
//             //           return const Text('Something went wrong');
//             //         }
//             //
//             //         if (snapshot.connectionState == ConnectionState.waiting) {
//             //           return const Center(child: CircularProgressIndicator());
//             //         }
//             //
//             //         if (snapshot.data!.docs != null &&
//             //             snapshot.data!.docs.isNotEmpty) {
//             //           return SizedBox(
//             //               height: MediaQuery.of(context).size.height - 500,
//             //               width: MediaQuery.of(context).size.width,
//             //               child: Padding(
//             //                 padding: const EdgeInsets.only(top: 15),
//             //                 child: ListView(
//             //                   scrollDirection: Axis.vertical,
//             //                   children: snapshot.data!.docs
//             //                       .map((DocumentSnapshot document) {
//             //                     Map<String, dynamic> productData =
//             //                         document.data()! as Map<String, dynamic>;
//             //                     return ListTile(
//             //                       leading: ClipRRect(
//             //                         borderRadius: const BorderRadius.all(
//             //                             Radius.circular(20)),
//             //                         child: CachedNetworkImage(
//             //                           imageUrl: document["Product_image"][0],
//             //                           placeholder: (context, url) =>
//             //                               const CircularProgressIndicator(),
//             //                           errorWidget: (context, url, error) =>
//             //                               const Icon(Icons.error),
//             //                         ),
//             //                       ),
//             //                       title: Row(
//             //                         children: [
//             //                           Expanded(
//             //                             child: Text(
//             //                               document["Product_Name"],
//             //                               maxLines: 1,
//             //                               overflow: TextOverflow.ellipsis,
//             //                             ),
//             //                           ),
//             //                         ],
//             //                       ),
//             //                       onTap: () {
//             //                         Navigator.of(context).push(
//             //                             MaterialPageRoute(
//             //                                 builder: (context) =>
//             //                                     ProductDetailScreen(
//             //                                         productData: productData)));
//             //                       },
//             //                     );
//             //                   }).toList(),
//             //                 ),
//             //               ));
//             //         } else {
//             //           return SizedBox(
//             //             child: Center(
//             //                 child:
//             //                     Image.asset("assets/images/product/img_1.png")),
//             //           );
//             //         }
//             //       },
//             //     ),
//             //   ],
//             // );
//           } else {
//             return SizedBox(
//               height: 300,
//               child:
//                   Center(child: Image.asset("assets/images/product/img_1.png")),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
class _LikedProductsScreenState extends State<LikedProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite items",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left)),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs != null && snapshot.data!.docs.isNotEmpty) {
            Map userData = snapshot.data!.docs.first.data();
            List likedProducts = [];
            likedProducts = userData["liked_products"];

            if (likedProducts.length > 0) {
              return Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('products')
                        .where("Product_Id", whereIn: likedProducts)
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
                                return ListTile(
                                  title:
                                      Text(productData["Product_Name"] ?? ""),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailScreen(
                                                    productData: productData)));
                                  },
                                );
                              }).toList(),
                            ));
                      } else {
                        return Center(child: Text("No liked products found"));
                      }
                    },
                  ),
                ],
              );
            } else {
              return Center(
                child: Image.asset("assets/images/No_Product_Found.png"),
              );
            }
          } else {
            return Center(child: Text("No liked products found"));
          }
        },
      ),
    );
  }
}
