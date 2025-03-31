import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothfactory/utils/size_constant.dart';
import 'package:flutter/material.dart';

class BannerCrousel extends StatefulWidget {
  const BannerCrousel({Key? key}) : super(key: key);

  @override
  State<BannerCrousel> createState() => _BannerCrouselState();
}

class _BannerCrouselState extends State<BannerCrousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> bannerImages = [
    "assets/images/slider_1.png",
    "assets/images/slider_2.png",
    "assets/images/slider_3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white24,
          padding: EdgeInsets.all(SizeConstant.appPadding),
          child: CarouselSlider(
            items: bannerImages
                .map(
                  (item) => Image.asset(
                    item,
                    fit: BoxFit.contain,
                  ),
                )
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Positioned.fill(
          bottom: 7,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bannerImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
