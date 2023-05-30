import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/saved/domain/entities/testdrives_list_entity.dart';
import 'package:anah_luxury/features/saved/domain/repo/user_testdrives_repo.dart';

class TestDrivesListUsecase extends Usecase {
  final UserTestDrivesRepo userTestDrivesRepo;

  TestDrivesListUsecase({required this.userTestDrivesRepo});
  @override
  Future<DataState<List<TestdriveListEntity>>> call(params) async {
    return await userTestDrivesRepo.getUserTestDriveList(requestParams: params);
  }
}
