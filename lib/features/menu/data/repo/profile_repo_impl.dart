import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/menu/data/models/profile_model.dart';
import 'package:anah_luxury/features/menu/domain/entities/profile_entity.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/menu/domain/repo/profile_repo.dart';
import 'package:dio/dio.dart';

class ProfileRepoImapl implements ProfileRepo {
  final NetworkManager networkManager;

  ProfileRepoImapl({required this.networkManager});
  @override
  Future<DataState<ProfileEntity>> getProfile(RequestParams params) async {
    Response? response;
    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response != null) {
        if (response.data != null) {
          final value = ProfileModel.fromJson(response.data);
          if (value.success!) {
            return DataSuccess(data: value.user);
          } else {
            return DataError(exception: Exception(value.message));
          }
        } else {
          return DataError(exception: Exception(response.statusMessage));
        }
      } else {
        return DataError(exception: Exception("No Data found from server"));
      }
    } on Exception catch (e) {
      return DataError(exception: Exception("Some Server err ${e.toString()}"));
    }
  }
}
