part of 'wish_list_controller_bloc.dart';

@immutable
abstract class WishListControllerState {}

class WishListControllerInitial extends WishListControllerState {}

class CarWishListFetchedState extends WishListControllerState {
  final List<WishListEntity> list;

  CarWishListFetchedState(this.list);
}

class ToursWishListFetchedState extends WishListControllerState {
  final List<WishListEntity> list;

  ToursWishListFetchedState(this.list);
}

class CarWishListFailedState extends WishListControllerState {
  final Exception exception;

  CarWishListFailedState(this.exception);
}

class ToursWishListFailedState extends WishListControllerState {
  final Exception exception;

  ToursWishListFailedState(this.exception);
}

class ProductAddedToWishList extends WishListControllerState {
  final String message;

  ProductAddedToWishList({required this.message});
}

class ProductFailedToWishlist extends WishListControllerState {
  final Exception exception;

  ProductFailedToWishlist({required this.exception});
}
