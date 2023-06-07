import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel(
      {super.key, required this.bannerList, this.height, required this.onTap});

  final List<String> bannerList;
  final double? height;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: bannerList.length,
        itemBuilder: (context, index, realIndex) {
          return InkWell(
            onTap: () {
              onTap(index);
            },
            child: FadeInImage(
                fadeInCurve: Curves.slowMiddle,
                fit: BoxFit.fill,
                placeholder:
                    const AssetImage(Assets.assetsHomePageImageLoading),
                image: NetworkImage(bannerList[index])),
          );
        },
        options: CarouselOptions(
          height: height ?? 300,
          disableCenter: true,
          aspectRatio: 1,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 1800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
}
