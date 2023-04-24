import 'package:anah_luxury/features/home/domain/entities/featured_luxury_residence_res_entity.dart';

class FeaturedResidenceResModel {
  bool? success;
  String? message;
  Data? data;

  FeaturedResidenceResModel({this.success, this.message, this.data});

  FeaturedResidenceResModel.fromJson(Map<String, dynamic> json) {
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
  List<FeaturedLuxuryRealEstate>? featuredLuxuryRealEstate;
  List<FeaturedLuxuryRealEstate>? newLuxuryRealEstate;

  Data({this.featuredLuxuryRealEstate, this.newLuxuryRealEstate});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['featuredLuxuryRealEstate'] != null) {
      featuredLuxuryRealEstate = <FeaturedLuxuryRealEstate>[];
      json['featuredLuxuryRealEstate'].forEach((v) {
        featuredLuxuryRealEstate!.add(FeaturedLuxuryRealEstate.fromJson(v));
      });
    }
    if (json['newLuxuryRealEstate'] != null) {
      newLuxuryRealEstate = <FeaturedLuxuryRealEstate>[];
      json['newLuxuryRealEstate'].forEach((v) {
        newLuxuryRealEstate!.add(FeaturedLuxuryRealEstate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (featuredLuxuryRealEstate != null) {
      data['featuredLuxuryRealEstate'] =
          featuredLuxuryRealEstate!.map((v) => v.toJson()).toList();
    }
    if (newLuxuryRealEstate != null) {
      data['newLuxuryRealEstate'] =
          newLuxuryRealEstate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedLuxuryRealEstate extends FeaturedLuxuryResidenceResEntity {
  // String? sId;
  // String? title;
  // String? slug;
  // List<UploadedFiles>? uploadedFiles;
  // int? salePrice;
  // List<Currency>? currency;

  FeaturedLuxuryRealEstate(
      {String? sId,
      String? title,
      String? slug,
      List<UploadedFiles>? uploadedFiles,
      double? salePrice,
      List<Currency>? currency})
      : super(
            sId: sId,
            salePrice: salePrice,
            slug: slug,
            title: title,
            currency: currency,
            uploadedFiles: uploadedFiles);

  factory FeaturedLuxuryRealEstate.fromJson(Map<String, dynamic> json) {
    List<UploadedFiles>? uploadedFiles = [];
    List<Currency>? currencyList = [];
    if (json['uploadedFiles'] != null) {
      json['uploadedFiles'].forEach((v) {
        uploadedFiles.add(UploadedFiles.fromJson(v));
      });
    }
    if (json['currency'] != null) {
      json['currency'].forEach((v) {
        currencyList.add(Currency.fromJson(v));
      });
    }
    return FeaturedLuxuryRealEstate(
        sId: json['_id'],
        title: json['title'],
        slug: json['slug'],
        salePrice: json['salePrice'].toDouble(),
        currency: currencyList,
        uploadedFiles: uploadedFiles);
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
