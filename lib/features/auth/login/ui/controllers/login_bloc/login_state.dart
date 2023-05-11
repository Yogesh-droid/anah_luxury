part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});
}

class LoginFailed extends LoginState {
  final Exception exception;

  LoginFailed({required this.exception});
}
