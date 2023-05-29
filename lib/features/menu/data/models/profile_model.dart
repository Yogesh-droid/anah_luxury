import 'package:anah_luxury/features/menu/domain/entities/profile_entity.dart';

class ProfileModel {
  bool? success;
  User? user;
  String? message;

  ProfileModel({this.success, this.user, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    message = json["message"];
  }
}

class User extends ProfileEntity {
  User(
      {String? lastName,
      String? mobile,
      String? gender,
      String? profilePic,
      dynamic country,
      String? language,
      String? sId,
      String? name,
      String? email,
      String? id})
      : super(
            country: country,
            email: email,
            gender: gender,
            id: id,
            language: language,
            lastName: lastName,
            mobile: mobile,
            name: name,
            profilePic: profilePic,
            sId: sId);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        lastName: json["last_name"],
        mobile: json["mobile"],
        gender: json["gender"],
        profilePic: json["profilePic"],
        country: json["country"],
        language: json["language"],
        sId: json["_id"],
        name: json["name"],
        email: json["email"],
        id: json["id"]);
  }
}
