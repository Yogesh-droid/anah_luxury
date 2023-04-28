// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CarsCategoryInitial extends CategoryState {}

class CategoryCarsSuccessState extends CategoryState {
  final List<CategoryEntity> categoryList;
  CategoryCarsSuccessState({
    required this.categoryList,
  });
}

class CategoryCarsErrorState extends CategoryState {
  final Exception exception;
  CategoryCarsErrorState({
    required this.exception,
  });
}
