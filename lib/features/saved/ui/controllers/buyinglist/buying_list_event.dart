part of 'buying_list_bloc.dart';

@immutable
abstract class BuyingListEvent {}

class GetBuyingListEvent extends BuyingListEvent {
  final String? slug;
  final String? userId;
  GetBuyingListEvent({this.slug, this.userId});
}
