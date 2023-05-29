part of 'book_product_cubit.dart';

@immutable
abstract class BookProductState {}

class BookProductInitial extends BookProductState {}

class ProductBookedSuccessState extends BookProductState {
  final String message;

  ProductBookedSuccessState({required this.message});
}

class ProductBookedFailedState extends BookProductState {
  final Exception exception;

  ProductBookedFailedState({required this.exception});
}
