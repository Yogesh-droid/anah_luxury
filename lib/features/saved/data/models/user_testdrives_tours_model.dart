import 'package:anah_luxury/features/saved/domain/entities/testdrives_list_entity.dart';

class UserTestdrivesToursModel {
  bool? success;
  String? message;
  Data? data;

  UserTestdrivesToursModel({this.success, this.message, this.data});

  UserTestdrivesToursModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }
}

class Data {
  List<BookedTestDriveTour>? bookedTestDriveTour;

  Data({this.bookedTestDriveTour});

  Data.fromJson(Map<String, dynamic> json) {
    bookedTestDriveTour = json["bookedTestDriveTour"] == null
        ? null
        : (json["bookedTestDriveTour"] as List)
            .map((e) => BookedTestDriveTour.fromJson(e))
            .toList();
  }
}

class BookedTestDriveTour {
  String? id;
  Product? product;

  BookedTestDriveTour({this.id, this.product});

  BookedTestDriveTour.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    product =
        json["product"] == null ? null : Product.fromJson(json["product"]);
  }
}

class Product extends TestdriveListEntity {
  Product({
    String? id,
    Cars? cars,
    RealEstates? realEstates,
    List<String>? categories,
    SubCategory? subCategory,
    String? title,
    int? price,
    List<UploadedFiles>? uploadedFiles,
    int? salePrice,
    String? location,
  }) : super(
          cars: cars,
          categories: categories,
          id: id,
          location: location,
          price: price,
          realEstates: realEstates,
          salePrice: salePrice,
          subCategory: subCategory,
          title: title,
          uploadedFiles: uploadedFiles,
        );

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["_id"],
        cars: json["cars"] == null ? null : Cars.fromJson(json["cars"]),
        realEstates: json["realEstates"] == null
            ? null
            : RealEstates.fromJson(json["realEstates"]),
        categories: json["categories"] == null
            ? null
            : List<String>.from(json["categories"]),
        subCategory: json["subCategory"] == null
            ? null
            : SubCategory.fromJson(json["subCategory"]),
        title: json["title"],
        price: json["price"],
        uploadedFiles: json["uploadedFiles"] == null
            ? null
            : (json["uploadedFiles"] as List)
                .map((e) => UploadedFiles.fromJson(e))
                .toList(),
        salePrice: json["salePrice"],
        location: json["location"]);
  }
}

class UploadedFiles {
  String? id;
  String? mimetype;
  String? fileUrl;
  String? imageType;

  UploadedFiles({this.id, this.mimetype, this.fileUrl, this.imageType});

  UploadedFiles.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    mimetype = json["mimetype"];
    fileUrl = json["fileUrl"];
    imageType = json["imageType"];
  }
}

class SubCategory {
  String? id;
  String? name;

  SubCategory({this.id, this.name});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
  }
}

class RealEstates {
  String? propertyType;

  RealEstates({this.propertyType});

  RealEstates.fromJson(Map<String, dynamic> json) {
    propertyType = json["propertyType"];
  }
}

class Cars {
  int? mileage;

  Cars({this.mileage});

  Cars.fromJson(Map<String, dynamic> json) {
    mileage = json["mileage"];
  }
}
