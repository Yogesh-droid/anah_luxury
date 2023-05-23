part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class GetCarDetailEvent extends ProductDetailEvent {
  final String slug;

  GetCarDetailEvent({required this.slug});
}
