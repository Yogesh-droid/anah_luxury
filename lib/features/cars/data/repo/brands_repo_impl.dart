// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/cars/data/model/brands_model.dart';
import 'package:anah_luxury/features/cars/domain/entity/brands_entity.dart';
import 'package:anah_luxury/features/cars/domain/repo/brands_repo.dart';
import 'package:dio/dio.dart';

class BrandsRepoImpl implements BrandsRepo {
  final NetworkManager networkManager;
  BrandsRepoImpl({
    required this.networkManager,
  });
  @override
  Future<DataState<List<BrandsEntity>>> getBrandsList(
      RequestParams params) async {
    Response? response;

    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response != null) {
        if (response.statusCode == 200) {
          final value = BrandsModel.fromJson(response.data);
          return DataSuccess(data: value.data!.brandsLogos);
        } else {
          return DataError(exception: Exception(response.statusMessage));
        }
      } else {
        return DataError(exception: Exception("Some Server Error"));
      }
    } on Exception catch (e) {
      return DataError(exception: e);
    }
  }
}
