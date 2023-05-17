import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:anah_luxury/features/auth/login/domain/repo/login_repo.dart';
import 'package:anah_luxury/features/auth/login/domain/usecases/login_response_usecase.dart';
import 'package:anah_luxury/features/auth/login/ui/controllers/login_bloc/login_bloc.dart';
import 'package:anah_luxury/features/cars/data/repo/brands_repo_impl.dart';
import 'package:anah_luxury/features/cars/data/repo/category_repo_impl.dart';
import 'package:anah_luxury/features/cars/domain/repo/brands_repo.dart';
import 'package:anah_luxury/features/cars/domain/repo/category_repo.dart';
import 'package:anah_luxury/features/cars/domain/usecases/brands_usecase.dart';
import 'package:anah_luxury/features/cars/domain/usecases/category_usecase.dart';
import 'package:anah_luxury/features/cars/ui/controllers/brands_bloc/brands_bloc.dart';
import 'package:anah_luxury/features/home/data/repo/featured_luxury_cars_repo_impl.dart';
import 'package:anah_luxury/features/home/data/repo/featured_luxury_residence_repo_impl.dart';
import 'package:anah_luxury/features/home/data/repo/home_page_banner_repo_impl.dart';
import 'package:anah_luxury/features/home/data/repo/home_page_cat_repo_impl.dart';
import 'package:anah_luxury/features/home/domain/repo/featured_luxury_cars_repo.dart';
import 'package:anah_luxury/features/home/domain/repo/home_page_banner_repo.dart';
import 'package:anah_luxury/features/home/domain/repo/home_page_cat_repo.dart';
import 'package:anah_luxury/features/home/domain/usecase/featured_luxury_cars_usecase.dart';
import 'package:anah_luxury/features/home/domain/usecase/featured_luxury_residence_usecase.dart';
import 'package:anah_luxury/features/home/domain/usecase/home_page_banner_usecase.dart';
import 'package:anah_luxury/features/home/domain/usecase/home_page_cat_usecase.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_cars/featured_luxury_cars_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/featured_luxury_residence/featured_lusxury_residence_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_banners_bloc/bloc/home_page_banner_bloc_bloc.dart';
import 'package:anah_luxury/features/home/ui/controllers/home_page_category_bloc/bloc/home_page_category_bloc_bloc.dart';
import 'package:anah_luxury/features/product_details/data/repo/car_detail_repo_impl.dart';
import 'package:anah_luxury/features/product_details/domain/repo/car_detail_repo.dart';
import 'package:anah_luxury/features/product_details/domain/usecases/car_details_usecase.dart';
import 'package:anah_luxury/features/product_details/ui/controllers/bloc/product_detail_bloc.dart';
import 'package:anah_luxury/features/product_listing/data/repo/product_list_repo_impl.dart';
import 'package:anah_luxury/features/product_listing/domain/repo/product_list_repo.dart';
import 'package:anah_luxury/features/product_listing/domain/usecases/product_list_usecase.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/product_list/product_list_bloc.dart';
import 'package:anah_luxury/features/properties/ui/controllers/properties_bloc/properties_category_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/cars/ui/controllers/category_bloc/category_bloc.dart';
import '../../features/home/domain/repo/featured_luxury_residence_repo.dart';

GetIt getIt = GetIt.I;
void setup() {
  /// Network calls
  getIt.registerLazySingleton(() => NetworkManager());

  /// For Home Page Banners
  getIt.registerFactory<HomePageBannerRepo>(
      () => HomePageBannerRepoImpl(networkManager: getIt()));
  getIt.registerFactory<HomePageBannerUsecase>(
      () => HomePageBannerUsecase(homePageBannerRepo: getIt()));
  getIt.registerFactory<HomePageBannerBlocBloc>(
      () => HomePageBannerBlocBloc(homePageBannerUsecase: getIt()));

  /// For HomePage category  cars and residence
  getIt.registerFactory<HomePageCatRepo>(
      () => HomePageCatRepoImpl(networkManager: getIt()));
  getIt.registerFactory<HomePageCatUsecase>(
      () => HomePageCatUsecase(homePageCatRepo: getIt()));
  getIt.registerFactory<HomePageCategoryBlocBloc>(
      () => HomePageCategoryBlocBloc(getIt()));

  /// For Luxury apartment and Feature apartments
  getIt.registerFactory<FeaturedLuxuryResidenceRepo>(
      () => FeaturedLuxuryResidenceRepoImpl(networkManager: getIt()));
  getIt.registerFactory(() =>
      FeaturedLuxuryResidenceUsecase(featuredLuxuryResidenceRepo: getIt()));
  getIt.registerFactory<FeaturedLusxuryResidenceBlocBloc>(() =>
      FeaturedLusxuryResidenceBlocBloc(
          featuredLuxuryResidenceUsecase: getIt()));

  ///  For featured and  Luxury cars///

  getIt.registerFactory<FeaturedLuxuryCarsRepo>(
      () => FeaturedLuxuryCarsRepoImpl(networkManager: getIt()));
  getIt.registerFactory<FeaturedLuxuryCarsUsecase>(
      () => FeaturedLuxuryCarsUsecase(featuredLuxuryCarsRepo: getIt()));
  getIt.registerFactory<FeaturedLuxuryCarsBlocBloc>(() =>
      FeaturedLuxuryCarsBlocBloc(
          featuredLuxuryCarsUsecase:
              FeaturedLuxuryCarsUsecase(featuredLuxuryCarsRepo: getIt())));

  ///  For Category on Cars and Properties Page ///

  getIt.registerFactory<CategoryRepo>(
      () => CategoryRepoImpl(networkManager: getIt()));
  getIt.registerFactory<CategoryUsecase>(
      () => CategoryUsecase(categoryRepo: getIt()));
  getIt.registerFactory<CarsAndPropCategoryBloc>(
      () => CarsAndPropCategoryBloc(categoryUsecase: getIt()));

  getIt.registerFactory<PropertiesCategoryBloc>(
      () => PropertiesCategoryBloc(getIt()));

  ///  For Brands on Cars Page ///

  getIt.registerFactory<BrandsRepo>(
      () => BrandsRepoImpl(networkManager: getIt()));
  getIt
      .registerFactory<BrandsUsecase>(() => BrandsUsecase(brandsRepo: getIt()));
  getIt.registerFactory<BrandsBloc>(() => BrandsBloc(brandsUsecase: getIt()));

  ////   For Getting product listing clicking on view all btn //////

  getIt.registerFactory<ProductListRepo>(
      () => ProductListRepoImpl(networkManager: getIt()));
  getIt.registerFactory<ProductListUsecase>(
      () => ProductListUsecase(productListRepo: getIt()));
  getIt.registerFactory<ProductListBloc>(
      () => ProductListBloc(productListUsecase: getIt()));

  ////   Login //////

  getIt
      .registerFactory<LoginRepo>(() => LoginRepoImpl(networkManager: getIt()));
  getIt.registerFactory<LoginResponseUsecase>(
      () => LoginResponseUsecase(loginRepo: getIt()));
  getIt.registerFactory<LoginBloc>(
      () => LoginBloc(loginResponseUsecase: getIt()));

  ///  Car Details  ////

  getIt.registerFactory<CarDetailRepo>(
      () => CarDetailRepoImpl(networkManager: getIt()));
  getIt.registerFactory<CarDetailUsecase>(
      () => CarDetailUsecase(carDetailRepo: getIt()));
  getIt.registerFactory<ProductDetailBloc>(
      () => ProductDetailBloc(carDetailUsecase: getIt()));
}
