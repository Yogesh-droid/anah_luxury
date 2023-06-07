import 'package:anah_luxury/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          return HomeCarousel(
              onTap: (value) {
                //print(state.bannerList[value].routeKey);
                context.pushNamed(state.bannerList[value].routePage ?? '',
                    queryParams: {
                      "query": state.bannerList[value].routeKey!.trim(),
                      "name": state.bannerList[value].title ?? '',
                      "category":
                          state.bannerList[value].routeKey!.split('&')[1]
                    });
              },
              bannerList: state.bannerList.map((e) => e.image ?? '').toList());
        }
      }
      return const Text('Some Err');
    });
  }
}
