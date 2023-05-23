import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/auth/login/domain/entities/login_response_entity.dart';
import 'package:anah_luxury/features/auth/login/domain/repo/login_repo.dart';

class LoginResponseUsecase extends Usecase {
  final LoginRepo loginRepo;

  LoginResponseUsecase({required this.loginRepo});
  @override
  Future<DataState<LoginResponseEntity>> call(params) async {
    DataState<LoginResponseEntity> dataState =
        await loginRepo.getLoginResponse(params);
    return dataState;
  }
}
