import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/domain/usecase/add_to_wishlist_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_to_wishlist_state.dart';

class AddToWishlistCubit extends Cubit<AddToWishlistState> {
  final AddToWishlistUsecase addToWishlistUsecase;
  AddToWishlistCubit({required this.addToWishlistUsecase})
      : super(AddToWishlistInitial());
  Future<String> addToWishList(
      {required String productId, required String userId}) async {
    try {
      emit(AddToWishlistInitial());
      DataState<String> dataState = await addToWishlistUsecase.call(
          RequestParams(
              url: "${baseUrl}addToWishlist",
              apiMethods: ApiMethods.post,
              body: {
            "product": [productId],
            "user": userId,
            "country": "60c9a6428729de2bf7ad0ebe"
          }));
      emit(ProductAddedToWishlist(message: dataState.data ?? ''));
      return dataState.data ?? '';
    } on Exception catch (e) {
      emit(FailedToAddProductWishlist(exception: e));
      return e.toString();
    }
  }
}
