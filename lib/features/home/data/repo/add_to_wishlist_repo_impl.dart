import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/home/domain/repo/add_to_wishlist_repo.dart';
import 'package:dio/dio.dart';

class AddToWishlistRepoImpl implements AddToWishlistRepo {
  final NetworkManager networkManager;

  AddToWishlistRepoImpl({required this.networkManager});
  @override
  Future<DataState<String>> addTowishList(RequestParams requestParams) async {
    Response? response;
    try {
      response = await networkManager.makeNetworkRequest(requestParams);
      if (response!.data != null) {
        String message = response.data['message'];
        return DataSuccess(data: message);
      } else {
        return DataError(exception: Exception("No Data found"));
      }
    } on Exception catch (e) {
      return DataError(exception: e);
    }
  }
}
