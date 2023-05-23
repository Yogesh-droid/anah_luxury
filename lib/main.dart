import 'package:anah_luxury/core/constants/app_theme.dart';
import 'package:anah_luxury/core/di/get_it_setup.dart';
import 'package:anah_luxury/core/routes/routes.dart';
import 'package:anah_luxury/features/auth/login/ui/controllers/login_bloc/login_bloc.dart';
import 'package:anah_luxury/features/auth/login/ui/controllers/password_visibility/password_visibility_cubit.dart';
import 'package:anah_luxury/features/cars/ui/controllers/brands_bloc/brands_bloc.dart';
import 'package:anah_luxury/features/dashboard/ui/controllers/cubit/bottom_nav_controller_cubit.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_cars/featured_luxury_cars_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_residence/featured_lusxury_residence_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_banners_bloc/bloc/home_page_banner_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_category_bloc/bloc/home_page_category_bloc_bloc.dart';
import 'package:anah_luxury/features/landing/ui/controllers/cubit/banner_text_controller_cubit.dart';
import 'package:anah_luxury/features/product_details/ui/controllers/product_image_switcher/product_image_switcher_cubit.dart';
import 'package:anah_luxury/features/product_details/ui/controllers/property_detail_bloc/property_detail_bloc.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/cubit/filter_cubit.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/cubit/range_slider_cubit.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/product_list/product_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'features/cars/ui/controllers/category_bloc/category_bloc.dart';
import 'features/product_details/ui/controllers/car_detail_bloc/product_detail_bloc.dart';
import 'features/properties_tab/ui/controllers/properties_bloc/properties_category_bloc.dart';

Future<void> main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final directory = await getApplicationSupportDirectory();
  Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BottomNavControllerCubit()),
          BlocProvider(create: (context) => BannerTextControllerCubit()),
          BlocProvider<HomePageBannerBlocBloc>(create: (context) => getIt()),
          BlocProvider<HomePageCategoryBlocBloc>(create: (context) => getIt()),
          BlocProvider<FeaturedLusxuryResidenceBlocBloc>(
              create: (context) => getIt()),
          BlocProvider<FeaturedLuxuryCarsBlocBloc>(
              create: (context) => getIt()),
          BlocProvider<CarsAndPropCategoryBloc>(
              create: (context) =>
                  CarsAndPropCategoryBloc(categoryUsecase: getIt())),
          BlocProvider<BrandsBloc>(
              create: (context) => BrandsBloc(brandsUsecase: getIt())),
          BlocProvider<PropertiesCategoryBloc>(
              create: (context) => PropertiesCategoryBloc(getIt())),
          BlocProvider<ProductListBloc>(
              create: (context) =>
                  ProductListBloc(productListUsecase: getIt())),
          BlocProvider<FilterCubit>(create: (context) => FilterCubit()),
          BlocProvider<RangeSliderCubit>(
              create: (context) => RangeSliderCubit()),
          BlocProvider<PasswordVisibilityCubit>(
              create: (context) => PasswordVisibilityCubit()),
          BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(loginResponseUsecase: getIt())),
          BlocProvider<ProductDetailBloc>(
              create: (context) =>
                  ProductDetailBloc(carDetailUsecase: getIt())),
          BlocProvider<PropertyDetailBloc>(
              create: (context) =>
                  PropertyDetailBloc(propertyDetailUsecase: getIt())),
          BlocProvider<ProductImageSwitcherCubit>(
              create: (context) => ProductImageSwitcherCubit())
        ],
        child: MaterialApp.router(
          title: 'Anah Luxury',
          theme: AppTheme.getAppTheme(context),
          routerConfig: router,
        ));
  }
}
