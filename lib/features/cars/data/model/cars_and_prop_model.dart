import 'package:anah_luxury/features/cars/domain/entity/category_entity.dart';

class CarsAndPropModel {
  bool? success;
  List<Children>? children;

  CarsAndPropModel({this.success, this.children});

  CarsAndPropModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children extends CategoryEntity {
  Children(
      {String? status,
      String? parentId,
      String? sId,
      String? name,
      String? slug,
      String? description,
      int? displayOrder,
      String? seoTitle,
      String? seoKeywords,
      String? seoDescription,
      int? isFeatured,
      String? imgPath,
      String? bannerImage,
      String? createdAt,
      String? updatedAt,
      int? iV})
      : super(
            parentId: parentId,
            sId: sId,
            name: name,
            slug: slug,
            description: description,
            displayOrder: displayOrder,
            seoTitle: seoTitle,
            seoDescription: seoDescription,
            isFeatured: isFeatured,
            imgPath: imgPath,
            bannerImage: bannerImage,
            createdAt: createdAt,
            updatedAt: updatedAt,
            iV: iV,
            seoKeywords: seoKeywords,
            status: status);

  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
        status: json['status'],
        parentId: json['parentId'],
        sId: json['_id'],
        name: json['name'],
        slug: json['slug'],
        description: json['description'],
        displayOrder: json['displayOrder'],
        seoTitle: json['seoTitle'],
        seoKeywords: json['seoKeywords'],
        seoDescription: json['seoDescription'],
        isFeatured: json['isFeatured'],
        imgPath: json['imgPath'],
        bannerImage: json['bannerImage'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        iV: json['__v']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['parentId'] = parentId;
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['displayOrder'] = displayOrder;
    data['seoTitle'] = seoTitle;
    data['seoKeywords'] = seoKeywords;
    data['seoDescription'] = seoDescription;
    data['isFeatured'] = isFeatured;
    data['imgPath'] = imgPath;
    data['bannerImage'] = bannerImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
