import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/menu/domain/entities/profile_entity.dart';
import 'package:anah_luxury/features/menu/domain/repo/profile_repo.dart';
import '../../../../core/usecase/usecase.dart';

class ProfileUsecase extends Usecase {
  final ProfileRepo profileRepo;

  ProfileUsecase({required this.profileRepo});
  @override
  Future<DataState<ProfileEntity>> call(params) async {
    return await profileRepo.getProfile(params);
  }
}
