part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListFinal extends ProductListState{
  final List<ProductListEntity> productList;

  ProductListFinal({required this.productList});
}

class ProductListError extends ProductListState{
  final Exception exception;

  ProductListError({required this.exception});

}
