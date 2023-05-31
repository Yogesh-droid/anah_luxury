import 'package:anah_luxury/features/saved/data/models/user_buying_list_model.dart';
import 'package:anah_luxury/features/saved/domain/entities/buying_list_entity.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/saved/domain/repo/buying_list_repo.dart';
import 'package:dio/dio.dart';
import '../../../../core/resource/network/network_manager.dart';

class BuyingListRepoImpl implements BuyingListRepo {
  final NetworkManager networkManager;

  BuyingListRepoImpl(this.networkManager);
  @override
  Future<DataState<List<BuyingListEntity>>> getUserBuyingListList(
      {RequestParams? requestParams}) async {
    try {
      Response? response;
      response = await networkManager.makeNetworkRequest(requestParams!);
      if (response!.data != null) {
        final value = UserBuyingListModel.fromJson(response.data!);
        List<BuyingListEntity> list = [];
        for (var element in value.cartF!) {
          list.add(element.product!);
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
