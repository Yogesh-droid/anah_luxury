import 'package:anah_luxury/features/product_details/data/models/car_detail_model.dart';
import 'package:anah_luxury/features/product_details/domain/entities/property_detail_entity.dart';

class PropertyDetailModel extends PropertyDetailEntity {
  PropertyDetailModel(
      {bool? success,
      String? title,
      String? propertyType,
      String? price,
      List<All>? all,
      List<All>? bedroom,
      List<All>? hall,
      List<All>? kitchen,
      List<All>? diningRoom,
      List<All>? livingRoom,
      List<All>? garden,
      List<All>? outside,
      String? bookingPrice,
      List<OverviewType>? propertyOverView,
      List<String>? otherFeatures,
      String? seller,
      String? id,
      String? categoryId})
      : super(
            all: all,
            bedroom: bedroom,
            bookingPrice: bookingPrice,
            diningRoom: diningRoom,
            garden: garden,
            hall: hall,
            kitchen: kitchen,
            livingRoom: livingRoom,
            otherFeatures: otherFeatures,
            outside: outside,
            price: price,
            propertyOverView: propertyOverView,
            propertyType: propertyType,
            seller: seller,
            success: success,
            title: title,
            id: id,
            categoryId: categoryId);

  factory PropertyDetailModel.fromJson(Map<String, dynamic> json) {
    return PropertyDetailModel(
        success: json["success"],
        title: json["title"],
        propertyType: json["propertyType"],
        price: json["price"],
        all: json["all"] == null
            ? null
            : (json["all"] as List).map((e) => All.fromJson(e)).toList(),
        bedroom: json["bedroom"] == null
            ? null
            : (json["bedroom"] as List).map((e) => All.fromJson(e)).toList(),
        hall: json["hall"] == null
            ? null
            : (json["hall"] as List).map((e) => All.fromJson(e)).toList(),
        kitchen: json["kitchen"] == null
            ? null
            : (json["kitchen"] as List).map((e) => All.fromJson(e)).toList(),
        diningRoom: json["diningRoom"] == null
            ? null
            : (json["diningRoom"] as List).map((e) => All.fromJson(e)).toList(),
        livingRoom: json["livingRoom"] == null
            ? null
            : (json["livingRoom"] as List).map((e) => All.fromJson(e)).toList(),
        garden: json["garden"] == null
            ? null
            : (json["garden"] as List).map((e) => All.fromJson(e)).toList(),
        outside: json["outside"] == null
            ? null
            : (json["outside"] as List).map((e) => All.fromJson(e)).toList(),
        bookingPrice: json["booking_price"],
        propertyOverView: json["propertyOverView"] == null
            ? null
            : (json["propertyOverView"] as List)
                .map((e) => OverviewType.fromJson(e))
                .toList(),
        otherFeatures: json["otherFeatures"] == null
            ? null
            : List<String>.from(json["otherFeatures"]),
        seller: json["seller"],
        id: json['id'],
        categoryId: json['categories']);
  }
}
