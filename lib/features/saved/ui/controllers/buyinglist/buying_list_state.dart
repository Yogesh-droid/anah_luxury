part of 'buying_list_bloc.dart';

@immutable
abstract class BuyingListState {}

class BuyingListInitial extends BuyingListState {}

class CarBuyingListFetchedState extends BuyingListState {
  final List<BuyingListEntity> list;

  CarBuyingListFetchedState(this.list);
}

class TourBuyingListFetched extends BuyingListState {
  final List<BuyingListEntity> list;

  TourBuyingListFetched(this.list);
}

class ToursBuyingListFailed extends BuyingListState {
  final Exception exception;

  ToursBuyingListFailed(this.exception);
}

class CarsBuyingListFailed extends BuyingListState {
  final Exception exception;

  CarsBuyingListFailed(this.exception);
}
