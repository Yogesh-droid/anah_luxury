part of 'product_list_bloc.dart';

@immutable
abstract class ProductListEvent {}

class GetProductListEvent extends ProductListEvent {
  final String query;

  GetProductListEvent({required this.query});
}
