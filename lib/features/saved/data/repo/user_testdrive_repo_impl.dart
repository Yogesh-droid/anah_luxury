import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/saved/data/models/user_testdrives_tours_model.dart';
import 'package:anah_luxury/features/saved/domain/entities/testdrives_list_entity.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:dio/dio.dart';
import '../../domain/repo/user_testdrives_repo.dart';

class UserTestDriveRepoImpl implements UserTestDrivesRepo {
  final NetworkManager networkManager;

  UserTestDriveRepoImpl(this.networkManager);
  @override
  Future<DataState<List<TestdriveListEntity>>> getUserTestDriveList(
      {RequestParams? requestParams}) async {
    try {
      Response? response;
      response = await networkManager.makeNetworkRequest(requestParams!);
      if (response!.data != null) {
        final value = UserTestdrivesToursModel.fromJson(response.data!);
        List<TestdriveListEntity> list = [];
        for (var element in value.data!.bookedTestDriveTour!) {
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
