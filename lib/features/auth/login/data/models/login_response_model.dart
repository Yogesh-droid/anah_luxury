import 'package:anah_luxury/features/auth/login/domain/entities/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({bool? success, String? token, String? message})
      : super(message: message, success: success, token: token);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        message: json['message'],
        success: json['success'],
        token: json['token']);
  }
}
