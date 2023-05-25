import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/cars/ui/controllers/brands_bloc/brands_bloc.dart';
import 'package:anah_luxury/features/home/ui/widgets/app_title_list_widget.dart';
import 'package:anah_luxury/features/home/ui/widgets/featured_car_list_widget.dart';
import 'package:anah_luxury/features/home/ui/widgets/popular_car_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/routes.dart';
import '../controllers/category_bloc/category_bloc.dart';
import '../widgets/brands_list.dart';
import '../widgets/category_list.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  @override
  void initState() {
    CarsAndPropCategoryBloc categoryBloc =
        context.read<CarsAndPropCategoryBloc>();
    if (categoryBloc.carsCategoryEntity.isEmpty) {
      categoryBloc.add(GetCarCategoryEvent());
    }

    BrandsBloc brandsBloc = context.read<BrandsBloc>();
    if (brandsBloc.brandsList.isEmpty) {
      brandsBloc.add(GetBrandsEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const AppTitleAndListWidget(
            title: kCategories, categoryBody: CategoryList()),
        const SizedBox(height: appWidgetGap),
        getBrandsLogo(),
        const SizedBox(height: appWidgetGap),
        AppTitleAndListWidget(
            title: kFeaturedCars,
            onViewAllTapped: () {
              context.pushNamed(productListPageName, queryParams: {
                "query":
                    "country=60c9a6428729de2bf7ad0ebe&category=cars&featureType=isFeatured",
                "name": kFeaturedCars,
                "category": kCars
              });
            },
            categoryBody: const FeaturedCarListWidget()),
        const SizedBox(height: appWidgetGap),
        AppTitleAndListWidget(
          title: kPopularCars,
          categoryBody: const PopularCarsList(),
          onViewAllTapped: () {
            context.pushNamed(productListPageName, queryParams: {
              "query":
                  "country=60c9a6428729de2bf7ad0ebe&category=cars&featureType=isPopular",
              "name": kPopularCars,
              "category": kCars
            });
          },
        ),
      ],
    ));
  }

  Widget getBrandsLogo() {
    return const AppTitleAndListWidget(
      title: kBrands,
      categoryBody: BrandsList(),
    );
  }
}
