part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class RequestLogin extends LoginEvent {
  final RequestParams requestParams;

  RequestLogin({required this.requestParams});
}
