// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_banner_bloc_bloc.dart';

@immutable
abstract class HomePageBannerBlocState {}

class HomePageBannerBlocInitial extends HomePageBannerBlocState {}

class HomePageBannerResultState extends HomePageBannerBlocState {
  final List<HomePageBannerResEntity> bannerList;
  HomePageBannerResultState({
    required this.bannerList,
  });
}
