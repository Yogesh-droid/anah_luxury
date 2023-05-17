part of 'login_bloc.dart';

abstract class LoginEvent {}

class RequestLogin extends LoginEvent {
  final RequestParams requestParams;

  RequestLogin({required this.requestParams});
}

class RequestSignUp extends LoginEvent {
  final RequestParams requestParams;

  RequestSignUp({required this.requestParams});
}
