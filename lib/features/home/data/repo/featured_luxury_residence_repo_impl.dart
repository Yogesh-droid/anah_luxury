// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/home/data/models/featured_luxury_residence_res_model.dart';
import 'package:anah_luxury/features/home/domain/entities/featured_luxury_residence_res_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/featured_luxury_residence_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class FeaturedLuxuryResidenceRepoImpl implements FeaturedLuxuryResidenceRepo {
  final NetworkManager networkManager;
  FeaturedLuxuryResidenceRepoImpl({
    required this.networkManager,
  });
  @override
  Future<
          DataState<
              Map<ResidenceCategory, List<FeaturedLuxuryResidenceResEntity>>>>
      getFeaturedLuxuryResidence(params) async {
    Response? response;
    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response != null) {
        if (response.statusCode == 200) {
          final value = FeaturedResidenceResModel.fromJson(response.data);
          return DataSuccess(data: {
            ResidenceCategory.luxury: value.data!.newLuxuryRealEstate!,
            ResidenceCategory.feature: value.data!.featuredLuxuryRealEstate!
          });
        } else {
          return DataError(
              exception:
                  Exception("Some thing went wrong ${response.statusMessage}"));
        }
      } else {
        return DataError(exception: Exception("No Response From server"));
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return response != null
          ? DataError(
              exception:
                  Exception("SomeThing gone wrong : ${response.statusMessage}"))
          : DataError(exception: Exception("No Response From server"));
    }
  }
}
