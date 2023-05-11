import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/auth/login/data/models/login_response_model.dart';
import 'package:anah_luxury/features/auth/login/domain/entities/login_response_entity.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/auth/login/domain/repo/login_repo.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl implements LoginRepo {
  final NetworkManager networkManager;

  LoginRepoImpl({required this.networkManager});
  @override
  Future<DataState<LoginResponseEntity>> getLoginResponse(
      RequestParams params) async {
    Response? response;
    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          final value = LoginResponseModel.fromJson(response.data);
          return DataSuccess(data: value);
        } else {
          return DataError(
              exception:
                  Exception("Something went wrong ${response.statusMessage}"));
        }
      } else {
        return DataError(exception: Exception("No Response From Server"));
      }
    } on Exception catch (e) {
      return DataError(exception: e);
    }
  }
}
