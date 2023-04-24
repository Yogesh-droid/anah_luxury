import 'package:anah_luxury/features/home/domain/entities/home_page_cat_res_entity.dart';

class HomePageCategoryResModel {
  bool? success;
  String? message;
  Data? data;

  HomePageCategoryResModel({this.success, this.message, this.data});

  HomePageCategoryResModel.fromJson(Map<String, dynamic> json) {
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
  List<Categories>? categories;

  Data({this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories extends HomePageCatResEntity {
  Categories(
      {String? sId,
      String? name,
      String? slug,
      String? imgPath,
      String? bannerImage})
      : super(
            name: name,
            sId: sId,
            slug: slug,
            bannerImage: bannerImage,
            imgPath: imgPath);

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        sId: json['_id'],
        name: json['name'],
        slug: json['slug'],
        bannerImage: json['bannerImage'],
        imgPath: json['imgPath']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
