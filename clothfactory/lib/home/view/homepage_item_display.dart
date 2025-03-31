import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothfactory/home/controller/homepagedisplayproductcontroller.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/size_constant.dart';

class HomepageDisplayItem extends StatelessWidget {
  const HomepageDisplayItem({
    Key? key,
    required this.productImagePath,
    required this.productName,
    required this.productPrice,
    required this.onTap,
  }) : super(key: key);
  final String productImagePath, productName, productPrice;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
      child: Card(
        color: Colors.white10,
        child: Padding(
          padding: EdgeInsets.all(SizeConstant.itemPadding),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: productImagePath,
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.45,
                    fit: BoxFit.fill,
                    // placeholder: (context, url) =>
                    //   const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'RS. $productPrice',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: ColoredBox(
                          color: ThemeColors.primaryColor,
                          child: IconButton(
                            onPressed: () {
                              return onTap();
                            },
                            icon: const Icon(Icons.add),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
