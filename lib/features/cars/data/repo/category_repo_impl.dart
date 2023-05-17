// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/features/cars/data/model/cars_and_prop_model.dart';
import 'package:dio/dio.dart';

import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/cars/domain/entity/category_entity.dart';
import 'package:anah_luxury/features/cars/domain/repo/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final NetworkManager networkManager;
  CategoryRepoImpl({
    required this.networkManager,
  });
  @override
  Future<DataState<List<CategoryEntity>>> getCategory(
      RequestParams params) async {
    Response? response;

    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response != null) {
        if (response.statusCode == 200) {
          final value = CarsAndPropModel.fromJson(response.data);
          return DataSuccess(data: value.children);
        } else {
          return DataError(
              exception:
                  Exception("Some Error Occured : ${response.statusMessage}"));
        }
      } else {
        return DataError(exception: Exception("Some Error From Server"));
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      return DataError(
          exception:
              Exception("Some Error Occured : ${response!.statusMessage}"));
    }
  }
}
