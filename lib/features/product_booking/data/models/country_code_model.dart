class CountryCodeModel {
  String? name;
  String? code;
  String? dialCode;

  CountryCodeModel({this.name, this.code, this.dialCode});

  CountryCodeModel.fromJson(Map<String, dynamic> map) {
    name = map["name"];
    code = map['code'];
    dialCode = map['dial_code'];
  }
}
