part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});
}

class SigningUp extends LoginState {}

class SignUpSuccess extends LoginState {
  final String token;

  SignUpSuccess({required this.token});
}

class LoginFailed extends LoginState {
  final Exception exception;

  LoginFailed({required this.exception});
}

class SignUpFailed extends LoginState {
  final Exception exception;

  SignUpFailed({required this.exception});
}
