// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'properties_category_bloc.dart';

@immutable
abstract class PropertiesCategoryState {}

class PropertiesCategoryInitial extends PropertiesCategoryState {}

class PropertiesCategorySuccess extends PropertiesCategoryState {
  final List<CategoryEntity> categoryList;
  PropertiesCategorySuccess({
    required this.categoryList,
  });
}

class PropertyErrorState extends PropertiesCategoryState {
  final Exception exception;
  PropertyErrorState({
    required this.exception,
  });
}
