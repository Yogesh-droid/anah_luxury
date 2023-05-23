import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/product_details/data/models/property_detail_model.dart';
import 'package:anah_luxury/features/product_details/domain/entities/property_detail_entity.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/product_details/domain/repo/property_detail_repo.dart';
import 'package:dio/dio.dart';

class PropertyDetailRepoImpl implements PropertyDetailRepo {
  final NetworkManager networkManager;

  PropertyDetailRepoImpl({required this.networkManager});
  @override
  Future<DataState<PropertyDetailEntity>> getPropertyDetails(
      RequestParams params) async {
    Response? response;
    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response != null) {
        if (response.data != null) {
          final value = PropertyDetailModel.fromJson(response.data);
          return DataSuccess(data: value);
        } else {
          return DataError(exception: Exception(response.statusMessage));
        }
      } else {
        return DataError(exception: Exception(response!.statusMessage));
      }
    } on Exception catch (e) {
      return DataError(exception: Exception(e.toString()));
    }
  }
}
