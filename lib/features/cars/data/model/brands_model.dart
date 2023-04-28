import 'package:anah_luxury/features/cars/domain/entity/brands_entity.dart';

class BrandsModel {
  bool? success;
  String? message;
  Data? data;

  BrandsModel({this.success, this.message, this.data});

  BrandsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<BrandsLogos>? brandsLogos;

  Data({this.brandsLogos});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['brandsLogos'] != null) {
      brandsLogos = <BrandsLogos>[];
      json['brandsLogos'].forEach((v) {
        brandsLogos!.add(BrandsLogos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (brandsLogos != null) {
      data['brandsLogos'] = brandsLogos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrandsLogos extends BrandsEntity {
  BrandsLogos({String? sId, String? slug, String? imgLogoPath})
      : super(imgLogoPath: imgLogoPath, sId: sId, slug: slug);

  factory BrandsLogos.fromJson(Map<String, dynamic> json) {
    return BrandsLogos(
        sId: json['_id'], slug: json['slug'], imgLogoPath: json['imgLogoPath']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['slug'] = slug;
    data['imgLogoPath'] = imgLogoPath;
    return data;
  }
}
