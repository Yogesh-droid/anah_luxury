part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class CarDetailFetched extends ProductDetailState {
  final CarDetailEntity carDetailEntity;

  CarDetailFetched({required this.carDetailEntity});
}

class CarDetailError extends ProductDetailState {
  final Exception exception;

  CarDetailError({required this.exception});
}
