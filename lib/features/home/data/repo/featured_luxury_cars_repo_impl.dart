// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/data/models/feature_luxury_cars_model.dart';
import 'package:anah_luxury/features/home/domain/entities/featured_luxury_cars_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/featured_luxury_cars_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class FeaturedLuxuryCarsRepoImpl extends FeaturedLuxuryCarsRepo {
  final NetworkManager networkManager;
  FeaturedLuxuryCarsRepoImpl({
    required this.networkManager,
  });
  @override
  Future<DataState<Map<CarsCategory, List<FeaturedLuxuryCarsEntity>>>>
      getFeaturedLuxuryCars(RequestParams params) async {
    Response? response;
    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response != null) {
        if (response.statusCode == 200) {
          final value = FeaturedLuxuryCarsModel.fromJson(response.data);
          return DataSuccess(data: {
            CarsCategory.featured: value.data!.featuredLuxuryCars!,
            CarsCategory.luxury: value.data!.popularLuxuryCars!
          });
        } else {
          return DataError(
              exception:
                  Exception("Some Error Occured ${response.statusMessage}"));
        }
      } else {
        return DataError(exception: Exception("No Response from server"));
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return DataError(exception: Exception("Some server error"));
    }
  }
}
