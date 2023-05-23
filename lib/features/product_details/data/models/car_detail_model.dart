import 'package:anah_luxury/features/product_details/domain/entities/car_detail_entity.dart';

class CarDetailModel extends CarDetailEntity {
  CarDetailModel(
      {bool? success,
      String? title,
      String? price,
      List<All>? all,
      List<All>? exterior,
      List<All>? interior,
      List<All>? wheel,
      List<All>? engine,
      String? bookingPrice,
      List<OverviewType>? carOverView,
      List<OverviewType>? carSpecification,
      List<UploadedFiles>? uploadedFiles,
      String? seller})
      : super(
            all: all,
            carOverView: carOverView,
            carSpecification: carSpecification,
            engine: engine,
            exterior: exterior,
            interior: interior,
            price: price,
            seller: seller,
            success: success,
            title: title,
            uploadedFiles: uploadedFiles,
            bookingPrice: bookingPrice,
            wheel: wheel);

  factory CarDetailModel.fromJson(Map<String, dynamic> json) {
    return CarDetailModel(
      carOverView: json["carOverView"] == null
          ? null
          : (json["carOverView"] as List)
              .map((e) => OverviewType.fromJson(e))
              .toList(),
      carSpecification: json["carSpecification"] == null
          ? null
          : (json["carSpecification"] as List)
              .map((e) => OverviewType.fromJson(e))
              .toList(),
      all: json["all"] == null
          ? null
          : (json["all"] as List).map((e) => All.fromJson(e)).toList(),
      engine: json["engine"] == null
          ? null
          : (json["engine"] as List).map((e) => All.fromJson(e)).toList(),
      exterior: json["exterior"] == null
          ? null
          : (json["exterior"] as List).map((e) => All.fromJson(e)).toList(),
      interior: json["interior"] == null
          ? null
          : (json["interior"] as List).map((e) => All.fromJson(e)).toList(),
      wheel: json["wheel"] == null
          ? null
          : (json["wheel"] as List).map((e) => All.fromJson(e)).toList(),
      bookingPrice: json["booking_price"],
      price: json["price"],
      seller: json["seller"],
      success: json["success"],
      title: json["title"],
      uploadedFiles: json["uploadedFiles"] == null
          ? null
          : (json["uploadedFiles"] as List)
              .map((e) => UploadedFiles.fromJson(e))
              .toList(),
    );
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

class CarSpecification {
  String? engine;
  String? seatingType;
  int? fuelTankCapacity;
  String? maxPower;

  CarSpecification(
      {this.engine, this.seatingType, this.fuelTankCapacity, this.maxPower});

  CarSpecification.fromJson(Map<String, dynamic> json) {
    engine = json["engine"];
    seatingType = json["seating_type"];
    fuelTankCapacity = json["fuel_tank_capacity"];
    maxPower = json["max_power"];
  }
}

class CarOverView {
  // int? purchaseYear;
  // String? location;
  // int? milesDriven;
  // String? isInsured;
  // String? insuredTill;
  // String? warranty;
  // String? transmission;
  // String? fuelType;
  List<OverviewType>? overViewType;

  CarOverView({this.overViewType
      //   this.purchaseYear,
      // this.location,
      // this.milesDriven,
      // this.isInsured,
      // this.insuredTill,
      // this.warranty,
      // this.transmission,
      // this.fuelType
      });

  CarOverView.fromJson(Map<String, dynamic> json) {
    overViewType = json[''];
    // purchaseYear = json["purchaseYear"];
    // location = json["location"];
    // milesDriven = json["miles_driven"];
    // isInsured = json["isInsured"];
    // insuredTill = json["insured_till"];
    // warranty = json["warranty"];
    // transmission = json["transmission"];
    // fuelType = json["fuel_type"];
  }
}

class OverviewType {
  String? title;
  dynamic value;

  OverviewType({this.title, this.value});

  OverviewType.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }
}

class All {
  String? id;
  String? mimetype;
  String? fileUrl;
  String? imageType;

  All({this.id, this.mimetype, this.fileUrl, this.imageType});

  All.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    mimetype = json["mimetype"];
    fileUrl = json["fileUrl"];
    imageType = json["imageType"];
  }
}
