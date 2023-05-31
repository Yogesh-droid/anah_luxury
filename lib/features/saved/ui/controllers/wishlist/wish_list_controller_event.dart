part of 'wish_list_controller_bloc.dart';

@immutable
abstract class WishListControllerEvent {}

class GetWishListEvent extends WishListControllerEvent {
  final String? slug;
  final String? userId;

  GetWishListEvent({this.slug, this.userId});
}
