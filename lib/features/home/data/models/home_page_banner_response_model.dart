import 'package:anah_luxury/features/home/domain/entities/home_page_banner_res_entity.dart';

class HomePageBannerResponseModel {
  bool? success;
  String? message;
  Data? data;

  HomePageBannerResponseModel({this.success, this.message, this.data});

  HomePageBannerResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<HomePageBanners>? homePageBanners;

  Data({this.homePageBanners});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['homePageBanners'] != null) {
      homePageBanners = <HomePageBanners>[];
      json['homePageBanners'].forEach((v) {
        homePageBanners!.add(HomePageBanners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (homePageBanners != null) {
      data['homePageBanners'] =
          homePageBanners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomePageBanners extends HomePageBannerResEntity {
  HomePageBanners(
      {String? type,
      String? routePage,
      String? routeKey,
      String? status,
      String? sId,
      String? title,
      String? description,
      String? image,
      int? displayOrder,
      int? homePageDisplayArea,
      String? createdAt})
      : super(
            type: type,
            routePage: routePage,
            routeKey: routeKey,
            status: status,
            sId: sId,
            title: title,
            description: description,
            image: image,
            createdAt: createdAt,
            displayOrder: displayOrder,
            homePageDisplayArea: homePageDisplayArea);

  factory HomePageBanners.fromJson(Map<String, dynamic> json) {
    return HomePageBanners(
        type: json['type'],
        routePage: json['routePage'],
        routeKey: json['routeKey'],
        status: json['status'],
        sId: json['_id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        displayOrder: json['displayOrder'],
        homePageDisplayArea: json['homePageDisplayArea'],
        createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['routePage'] = routePage;
    data['routeKey'] = routeKey;
    data['status'] = status;
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['displayOrder'] = displayOrder;
    data['homePageDisplayArea'] = homePageDisplayArea;
    data['createdAt'] = createdAt;
    return data;
  }
}
