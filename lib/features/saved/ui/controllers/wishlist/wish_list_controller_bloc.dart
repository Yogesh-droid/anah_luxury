import 'package:anah_luxury/features/saved/domain/entities/wishlist_entity.dart';
import 'package:anah_luxury/features/saved/domain/usecases/wishlist_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/resource/data_state/data_state.dart';
import '../../../../../core/resource/request_params/request_params.dart';
part 'wish_list_controller_event.dart';
part 'wish_list_controller_state.dart';

class WishListControllerBloc
    extends Bloc<WishListControllerEvent, WishListControllerState> {
  final WishListUsecase wishListUsecase;
  List<WishListEntity> carsWishList = [];
  List<WishListEntity> toursWishList = [];
  WishListControllerBloc(this.wishListUsecase)
      : super(WishListControllerInitial()) {
    on<WishListControllerEvent>((event, emit) async {
      if (event is GetWishListEvent) {
        switch (event.slug) {
          case 'cars':
            try {
              DataState<List<WishListEntity>> dataState =
                  await wishListUsecase.call(RequestParams(
                      url:
                          "${baseUrl}web/userWishlist/${event.userId}?country=60c9a6428729de2bf7ad0ebe&category=${event.slug}",
                      apiMethods: ApiMethods.get,
                      header: header));
              if (dataState.data != null) {
                carsWishList = dataState.data!;
                emit(CarWishListFetchedState(dataState.data!));
              } else {
                emit(CarWishListFailedState(Exception("Data is Null")));
              }
            } on Exception catch (e) {
              emit(CarWishListFailedState(e));
            }
            break;
          case 'real-estate':
            try {
              DataState<List<WishListEntity>> dataState =
                  await wishListUsecase.call(RequestParams(
                      url:
                          "${baseUrl}web/userWishlist/${event.userId}?country=60c9a6428729de2bf7ad0ebe&category=${event.slug}",
                      apiMethods: ApiMethods.get,
                      header: header));
              if (dataState.data != null) {
                toursWishList = dataState.data!;
                emit(ToursWishListFetchedState(dataState.data!));
              } else {
                emit(ToursWishListFailedState(Exception("Data is Null")));
              }
            } on Exception catch (e) {
              emit(ToursWishListFailedState(e));
            }
            break;
          default:
        }
      }
    });
  }
}
