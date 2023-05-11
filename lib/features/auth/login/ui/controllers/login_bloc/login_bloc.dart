import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/auth/login/domain/entities/login_response_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/usecases/login_response_usecase.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginResponseUsecase loginResponseUsecase;

  LoginBloc({required this.loginResponseUsecase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        if (event is RequestLogin) {
          DataState<LoginResponseEntity> dataState =
              await loginResponseUsecase.call(event.requestParams);
          if (dataState.data != null) {
            emit(LoginSuccess(token: dataState.data!.token ?? ''));
          } else {
            emit(LoginFailed(exception: Exception(dataState.exception)));
          }
        }
      } on Exception catch (e) {
        emit(LoginFailed(exception: e));
      }
    });
  }
}
