part of 'add_to_wishlist_cubit.dart';

@immutable
abstract class AddToWishlistState {}

class AddToWishlistInitial extends AddToWishlistState {}

class ProductAddedToWishlist extends AddToWishlistState {
  final String message;

  ProductAddedToWishlist({required this.message});
}

class FailedToAddProductWishlist extends AddToWishlistState {
  final Exception exception;

  FailedToAddProductWishlist({required this.exception});
}
