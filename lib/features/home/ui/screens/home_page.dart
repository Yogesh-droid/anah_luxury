import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_cars/featured_luxury_cars_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_residence/featured_lusxury_residence_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_banners_bloc/bloc/home_page_banner_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_category_bloc/bloc/home_page_category_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/screens/home_carousel.dart';
import 'package:anah_luxury/features/home/ui/widgets/anah_search_bar.dart';
import 'package:anah_luxury/features/home/ui/widgets/category_container.dart';
import 'package:anah_luxury/features/home/ui/widgets/product_container.dart';
import 'package:anah_luxury/features/home/ui/widgets/product_horizontal_list.dart';
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
          const SizedBox(
            height: 20,
          ),
          getHomePageBannerWidget(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ProductHorizontalList(
              title: kBrowseBy,
              categoryBody: getCategoryList(context),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(18),
              child: ProductHorizontalList(
                title: kFeaturedResidence,
                onViewAllTapped: () {},
                categoryBody: getFeaturedResidenceList(context),
              )),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(18),
              child: ProductHorizontalList(
                title: kFeaturedCars,
                onViewAllTapped: () {},
                categoryBody: getFeaturedCarsList(context),
              )),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(18),
              child: ProductHorizontalList(
                title: kNewResidence,
                onViewAllTapped: () {},
                categoryBody: getNewResidenceList(context),
              )),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(18),
              child: ProductHorizontalList(
                title: kFeaturedCars,
                onViewAllTapped: () {},
                categoryBody: getPopularCarsList(context),
              ))
        ],
      )),
    );
  }

  Widget getCategoryList(BuildContext context) {
    return BlocBuilder<HomePageCategoryBlocBloc, HomePageCategoryBlocState>(
      builder: (context, state) {
        if (state is HomePageCategoryBlocInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomePageCategoryResultState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
              children: state.categoryList
                  .map(
                    (e) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CategoryContainer(
                          title: e.name ?? ''.toUpperCase(),
                          onCategoryTapped: () {},
                          shadeColor: Colors.black,
                          backgroundImage: e.imgPath ??
                              'https://images.pexels.com/photos/3786092/pexels-photo-3786092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }
        return const Center(
          child: Text("Some Err"),
        );
      },
    );
  }

  Widget getFeaturedResidenceList(BuildContext context) {
    return BlocBuilder<FeaturedLusxuryResidenceBlocBloc,
        FeaturedLusxuryResidenceBlocState>(builder: (context, state) {
      if (state is FeaturedLusxuryResidenceBlocInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FeaturedLuxuryResidenceResState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.258,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: state.featuredApartments
                .map((e) => ProductContainer(
                      productName: e.title ?? '',
                      onProductTapped: () {},
                      backgroundImage: e.uploadedFiles![0].fileUrl,
                      currency: e.currency![0].currencyName,
                      netPrice: e.salePrice.toString(),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width / 2,
                    ))
                .toList(),
          ),
        );
      }
      return const Center(child: Text("Some Err"));
    });
  }

  Widget getFeaturedCarsList(BuildContext context) {
    return BlocBuilder<FeaturedLuxuryCarsBlocBloc, FeaturedLuxuryCarsBlocState>(
        builder: (context, state) {
      if (state is FeaturedLuxuryCarsBlocInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FeaturedLuxuryCarsREsState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.258,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: state.featuredCarsList
                .map((e) => ProductContainer(
                      productName: e.title ?? '',
                      onProductTapped: () {},
                      backgroundImage: e.uploadedFiles![0].fileUrl,
                      currency: e.currency![0].currencyName,
                      netPrice: e.salePrice.toString(),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width / 2,
                    ))
                .toList(),
          ),
        );
      } else if (state is FeaturedluxuryCarsErrorState) {
        return Center(child: Text("Some Err ${state.err.toString()}"));
      }
      return const Center(child: Text("Some Err "));
    });
  }

  Widget getPopularCarsList(BuildContext context) {
    return BlocBuilder<FeaturedLuxuryCarsBlocBloc, FeaturedLuxuryCarsBlocState>(
        builder: (context, state) {
      if (state is FeaturedLuxuryCarsBlocInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FeaturedLuxuryCarsREsState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.258,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: state.luxuryCarsList
                .map((e) => ProductContainer(
                      productName: e.title ?? '',
                      onProductTapped: () {},
                      backgroundImage: e.uploadedFiles![0].fileUrl,
                      currency: e.currency![0].currencyName,
                      netPrice: e.salePrice.toString(),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width / 2,
                    ))
                .toList(),
          ),
        );
      } else if (state is FeaturedluxuryCarsErrorState) {
        return Center(child: Text("Some Err ${state.err.toString()}"));
      }
      return const Center(child: Text("Some Err "));
    });
  }

  Widget getNewResidenceList(BuildContext context) {
    return BlocBuilder<FeaturedLusxuryResidenceBlocBloc,
        FeaturedLusxuryResidenceBlocState>(builder: (context, state) {
      if (state is FeaturedLusxuryResidenceBlocInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FeaturedLuxuryResidenceResState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.258,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: state.luxuryApartment
                .map((e) => ProductContainer(
                      productName: e.title ?? '',
                      onProductTapped: () {},
                      backgroundImage: e.uploadedFiles![0].fileUrl,
                      currency: e.currency![0].currencyName,
                      netPrice: e.salePrice.toString(),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width / 2,
                    ))
                .toList(),
          ),
        );
      }
      return const Center(child: Text("Some Err"));
    });
  }

  void getHomePagebanners() {
    HomePageBannerBlocBloc homePageBannerBlocBloc =
        context.read<HomePageBannerBlocBloc>();
    if (homePageBannerBlocBloc.bannerList.isEmpty) {
      homePageBannerBlocBloc.add(GetHomePageBannersEvent());
    }
  }

  Widget getHomePageBannerWidget() {
    return BlocBuilder<HomePageBannerBlocBloc, HomePageBannerBlocState>(
        builder: (context, state) {
      if (state is HomePageBannerBlocInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is HomePageBannerResultState) {
        if (state.bannerList.isNotEmpty) {
          return HomeCarousel(bannerList: state.bannerList);
        }
      }
      return const Text('Some Err');
    });
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
