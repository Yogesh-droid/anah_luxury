import 'package:anah_luxury/features/saved/domain/usecases/user_buyinglist_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/resource/data_state/data_state.dart';
import '../../../../../core/resource/request_params/request_params.dart';
import '../../../domain/entities/buying_list_entity.dart';
part 'buying_list_event.dart';
part 'buying_list_state.dart';

class BuyingListBloc extends Bloc<BuyingListEvent, BuyingListState> {
  final ByuingListUsecase byuingListUsecase;
  List<BuyingListEntity> carBuyingList = [];
  List<BuyingListEntity> propertyBuyingList = [];
  BuyingListBloc(this.byuingListUsecase) : super(BuyingListInitial()) {
    on<BuyingListEvent>((event, emit) async {
      if (event is GetBuyingListEvent) {
        switch (event.slug) {
          case 'cars':
            try {
              DataState<List<BuyingListEntity>> dataState =
                  await byuingListUsecase.call(RequestParams(
                      url:
                          "${baseUrl}web/userCart/${event.userId}?country=60c9a6428729de2bf7ad0ebe&category=${event.slug}",
                      apiMethods: ApiMethods.get,
                      header: header));
              if (dataState.data != null) {
                carBuyingList = dataState.data!;
                emit(CarBuyingListFetchedState(dataState.data!));
              } else {
                emit(CarsBuyingListFailed(Exception("Data is Null")));
              }
            } on Exception catch (e) {
              emit(CarsBuyingListFailed(e));
            }
            break;
          case 'real-estate':
            try {
              DataState<List<BuyingListEntity>> dataState =
                  await byuingListUsecase.call(RequestParams(
                      url:
                          "${baseUrl}web/userCart/${event.userId}?country=60c9a6428729de2bf7ad0ebe&category=${event.slug}",
                      apiMethods: ApiMethods.get,
                      header: header));
              if (dataState.data != null) {
                propertyBuyingList = dataState.data!;
                emit(TourBuyingListFetched(dataState.data!));
              } else {
                emit(ToursBuyingListFailed(Exception("Data is Null")));
              }
            } on Exception catch (e) {
              emit(ToursBuyingListFailed(e));
            }
            break;
          default:
        }
      }
    });
  }
}
