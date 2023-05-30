import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import '../entities/testdrives_list_entity.dart';

abstract class UserTestDrivesRepo {
  Future<DataState<List<TestdriveListEntity>>> getUserTestDriveList(
      {RequestParams requestParams});
}
