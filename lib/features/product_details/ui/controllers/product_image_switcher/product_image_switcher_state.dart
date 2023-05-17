part of 'product_image_switcher_cubit.dart';

@immutable
abstract class ProductImageSwitcherState {}

class ProductImageSwitcherInitial extends ProductImageSwitcherState {}

class ProductImagesSwitched extends ProductImageSwitcherState {
  final List<All> productImages;

  ProductImagesSwitched({required this.productImages});
}
