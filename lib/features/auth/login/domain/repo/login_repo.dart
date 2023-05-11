import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/auth/login/domain/entities/login_response_entity.dart';

abstract class LoginRepo {
  Future<DataState<LoginResponseEntity>> getLoginResponse(RequestParams params);
}
