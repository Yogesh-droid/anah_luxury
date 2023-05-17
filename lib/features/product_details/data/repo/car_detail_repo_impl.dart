import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/product_details/data/models/car_detail_model.dart';
import 'package:anah_luxury/features/product_details/domain/entities/car_detail_entity.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/product_details/domain/repo/car_detail_repo.dart';
import 'package:dio/dio.dart';

class CarDetailRepoImpl implements CarDetailRepo {
  final NetworkManager networkManager;

  CarDetailRepoImpl({required this.networkManager});
  @override
  Future<DataState<CarDetailEntity>> getCarDetails(RequestParams params) async {
    Response? response;
    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        if (response.data != null) {
          final value = CarDetailModel.fromJson(response.data);
          return DataSuccess(data: value);
        } else {
          return DataError(exception: Exception(response.statusMessage));
        }
      } else {
        return DataError(exception: Exception(response.statusMessage));
      }
    } on Exception catch (e) {
      return DataError(exception: Exception(e.toString()));
    }
  }
}
