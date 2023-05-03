import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_cars/featured_luxury_cars_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_residence/featured_lusxury_residence_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_banners_bloc/bloc/home_page_banner_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_category_bloc/bloc/home_page_category_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/widgets/anah_search_bar.dart';
import 'package:anah_luxury/features/home/ui/widgets/app_title_list_widget.dart';
import 'package:anah_luxury/features/home/ui/widgets/category_list_widget.dart';
import 'package:anah_luxury/features/home/ui/widgets/featured_car_list_widget.dart';
import 'package:anah_luxury/features/home/ui/widgets/featured_residence_list_widget.dart';
import 'package:anah_luxury/features/home/ui/widgets/home_page_banner_widget.dart';
import 'package:anah_luxury/features/home/ui/widgets/new_residence_list_widget.dart';
import 'package:anah_luxury/features/home/ui/widgets/popular_car_list.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/product_list/product_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getHomePagebanners();
    getHomePageCat();
    getFeatureAndLuxuryResidence();
    getFeaturedAndLuxuryCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      maintainBottomViewPadding: true,
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: AnahSearchBar(onChange: (value) {}),
          ),
          const SizedBox(height: appPadding),
          const HomePagebannerWidget(),
          const SizedBox(height: appWidgetGap),
          const AppTitleAndListWidget(
            title: kBrowseBy,
            categoryBody: CategoryListWidget(),
          ),
          const SizedBox(height: appWidgetGap),
          AppTitleAndListWidget(
            title: kFeaturedResidence,
            onViewAllTapped: () {
              print('Ontap');
              context.read<ProductListBloc>().add(GetProductListEvent(query: "category=cars"));
            },
            categoryBody: const FeaturedResidenceListWidget(),
          ),
          const SizedBox(height: appWidgetGap),
          AppTitleAndListWidget(
            title: kFeaturedCars,
            onViewAllTapped: () {},
            categoryBody: const FeaturedCarListWidget(),
          ),
          const SizedBox(height: appWidgetGap),
          AppTitleAndListWidget(
            title: kNewResidence,
            onViewAllTapped: () {},
            categoryBody: const NewResidenceListWidget(),
          ),
          const SizedBox(height: appWidgetGap),
          AppTitleAndListWidget(
              title: kPopularCars,
              onViewAllTapped: () {},
              categoryBody: const PopularCarsList())
        ],
      )),
    );
  }

  void getHomePagebanners() {
    HomePageBannerBlocBloc homePageBannerBlocBloc =
        context.read<HomePageBannerBlocBloc>();
    if (homePageBannerBlocBloc.bannerList.isEmpty) {
      homePageBannerBlocBloc.add(GetHomePageBannersEvent());
    }
  }

  Future<void> getHomePageCat() async {
    HomePageCategoryBlocBloc homePageCategoryBlocBloc =
        context.read<HomePageCategoryBlocBloc>();
    if (homePageCategoryBlocBloc.categoryList.isEmpty) {
      homePageCategoryBlocBloc.add(GetHomePageCatEvent());
    }
  }

  Future<void> getFeatureAndLuxuryResidence() async {
    FeaturedLusxuryResidenceBlocBloc featuredLusxuryResidenceBlocBloc =
        context.read<FeaturedLusxuryResidenceBlocBloc>();
    if (featuredLusxuryResidenceBlocBloc.luxuryApartment.isEmpty &&
        featuredLusxuryResidenceBlocBloc.featuredApartments.isEmpty) {
      featuredLusxuryResidenceBlocBloc.add(GetFeaturedLuxuryResidenceEvent());
    }
  }

  Future<void> getFeaturedAndLuxuryCars() async {
    final FeaturedLuxuryCarsBlocBloc featuredLuxuryCarsBlocBloc =
        context.read<FeaturedLuxuryCarsBlocBloc>();
    if (featuredLuxuryCarsBlocBloc.featuredCars.isEmpty &&
        featuredLuxuryCarsBlocBloc.luxuryCars.isEmpty) {
      featuredLuxuryCarsBlocBloc.add(GetFeaturedLuxuryCarsEvent());
    }
  }
}
