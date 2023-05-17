import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/home_page_banners_bloc/bloc/home_page_banner_bloc_bloc.dart';
import '../screens/home_carousel.dart';

class HomePagebannerWidget extends StatelessWidget {
  const HomePagebannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBannerBlocBloc, HomePageBannerBlocState>(
        builder: (context, state) {
      if (state is HomePageBannerBlocInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is HomePageBannerResultState) {
        if (state.bannerList.isNotEmpty) {
          List<String> bannerList = [];
          for (var element in state.bannerList) {
            bannerList.add(element.image ?? '');
          }
          return HomeCarousel(bannerList: bannerList);
        }
      }
      return const Text('Some Err');
    });
  }
}
