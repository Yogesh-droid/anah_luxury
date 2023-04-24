import 'package:anah_luxury/core/di/get_it_setup.dart';
import 'package:anah_luxury/core/routes/routes.dart';
import 'package:anah_luxury/features/dashboard/ui/controllers/cubit/bottom_nav_controller_cubit.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_cars/featured_luxury_cars_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_residence/featured_lusxury_residence_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_banners_bloc/bloc/home_page_banner_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_category_bloc/bloc/home_page_category_bloc_bloc.dart';
import 'package:anah_luxury/features/login/ui/controllers/cubit/banner_text_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
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
          BlocProvider<FeaturedLuxuryCarsBlocBloc>(create: (context) => getIt())
        ],
        child: MaterialApp.router(
          title: 'Anah Luxury',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerConfig: router,
        ));
  }
}
