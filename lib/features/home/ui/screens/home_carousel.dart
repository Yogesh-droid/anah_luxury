import 'package:anah_luxury/features/home/domain/entities/home_page_banner_res_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key, required this.bannerList});

  final List<HomePageBannerResEntity> bannerList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: bannerList.length,
        itemBuilder: (context, index, realIndex) {
          return FadeInImage(
              fadeInCurve: Curves.slowMiddle,
              fit: BoxFit.fill,
              placeholder: const AssetImage(Assets.assetsHomePageImageLoading),
              image: NetworkImage(bannerList[index].image ?? ''));
        },
        options: CarouselOptions(
          height: 300,
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
