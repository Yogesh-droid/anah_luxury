part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListFinal extends ProductListState{
  final List<ProductListEntity> productList;
  final FilterEntity filtersList;

  ProductListFinal({required this.productList,required this.filtersList});
}

class ProductListError extends ProductListState{
  final Exception exception;

  ProductListError({required this.exception});

}
