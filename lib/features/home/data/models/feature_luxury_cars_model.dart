import 'package:anah_luxury/features/home/domain/entities/featured_luxury_cars_entity.dart';

class FeaturedLuxuryCarsModel {
  bool? success;
  String? message;
  Data? data;

  FeaturedLuxuryCarsModel({this.success, this.message, this.data});

  FeaturedLuxuryCarsModel.fromJson(Map<String, dynamic> json) {
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
  List<FeaturedLuxuryCars>? featuredLuxuryCars;
  List<FeaturedLuxuryCars>? popularLuxuryCars;

  Data({this.featuredLuxuryCars, this.popularLuxuryCars});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['featuredLuxuryCars'] != null) {
      featuredLuxuryCars = <FeaturedLuxuryCars>[];
      json['featuredLuxuryCars'].forEach((v) {
        featuredLuxuryCars!.add(FeaturedLuxuryCars.fromJson(v));
      });
    }
    if (json['popularLuxuryCars'] != null) {
      popularLuxuryCars = <FeaturedLuxuryCars>[];
      json['popularLuxuryCars'].forEach((v) {
        popularLuxuryCars!.add(FeaturedLuxuryCars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (featuredLuxuryCars != null) {
      data['featuredLuxuryCars'] =
          featuredLuxuryCars!.map((v) => v.toJson()).toList();
    }
    if (popularLuxuryCars != null) {
      data['popularLuxuryCars'] =
          popularLuxuryCars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedLuxuryCars extends FeaturedLuxuryCarsEntity {
  FeaturedLuxuryCars(
      {String? sId,
      String? title,
      String? slug,
      List<UploadedFiles>? uploadedFiles,
      double? salePrice,
      List<Currency>? currency})
      : super(
            sId: sId,
            slug: slug,
            title: title,
            salePrice: salePrice,
            currency: currency,
            uploadedFiles: uploadedFiles);

  factory FeaturedLuxuryCars.fromJson(Map<String, dynamic> json) {
    List<UploadedFiles> uploadedFileList = [];
    List<Currency> currencyList = [];
    if (json['uploadedFiles'] != null) {
      json['uploadedFiles'].forEach((v) {
        uploadedFileList.add(UploadedFiles.fromJson(v));
      });
    }
    if (json['currency'] != null) {
      json['currency'].forEach((v) {
        currencyList.add(Currency.fromJson(v));
      });
    }
    return FeaturedLuxuryCars(
        sId: json['_id'],
        title: json['title'],
        salePrice: json['salePrice'].toDouble(),
        slug: json['slug'],
        currency: currencyList,
        uploadedFiles: uploadedFileList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    if (uploadedFiles != null) {
      data['uploadedFiles'] = uploadedFiles!.map((v) => v.toJson()).toList();
    }
    data['salePrice'] = salePrice;
    if (currency != null) {
      data['currency'] = currency!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UploadedFiles {
  String? sId;
  String? mimetype;
  String? fileUrl;

  UploadedFiles({this.sId, this.mimetype, this.fileUrl});

  UploadedFiles.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mimetype = json['mimetype'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['mimetype'] = mimetype;
    data['fileUrl'] = fileUrl;
    return data;
  }
}

class Currency {
  String? currencyName;

  Currency({this.currencyName});

  Currency.fromJson(Map<String, dynamic> json) {
    currencyName = json['currencyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currencyName'] = currencyName;
    return data;
  }
}
