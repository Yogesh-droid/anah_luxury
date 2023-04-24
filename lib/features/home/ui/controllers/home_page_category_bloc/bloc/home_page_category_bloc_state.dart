// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_category_bloc_bloc.dart';

abstract class HomePageCategoryBlocState {}

class HomePageCategoryBlocInitial extends HomePageCategoryBlocState {}

class HomePageCategoryResultState extends HomePageCategoryBlocState {
  final List<HomePageCatResEntity> categoryList;
  HomePageCategoryResultState({
    required this.categoryList,
  });
}
