import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/saved/data/models/user_wishlist_model.dart';
import 'package:anah_luxury/features/saved/domain/entities/wishlist_entity.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/saved/domain/repo/user_wishlist_repo.dart';
import 'package:dio/dio.dart';

class WishListRepoImpl implements UserWishListRepo {
  final NetworkManager networkManager;
  WishListRepoImpl(this.networkManager);
  @override
  Future<DataState<List<WishListEntity>>> getUseWishList(
      {RequestParams? requestParams}) async {
    try {
      Response? response;
      response = await networkManager.makeNetworkRequest(requestParams!);
      if (response!.data != null) {
        final value = UserWishlistModel.fromJson(response.data!);
        List<WishListEntity> list = [];
        for (var element in value.wishlist!) {
          list.add(element.product![0]);
        }
        return DataSuccess(data: list);
      } else {
        return DataError(exception: Exception("Data is null"));
      }
    } on Exception catch (e) {
      return DataError(exception: e);
    }
  }
}
