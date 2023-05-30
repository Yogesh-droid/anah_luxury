import '../../data/models/user_testdrives_tours_model.dart';

class TestdriveListEntity {
  final String? id;
  final Cars? cars;
  final RealEstates? realEstates;
  final List<String>? categories;
  final SubCategory? subCategory;
  final String? title;
  final int? price;
  final List<UploadedFiles>? uploadedFiles;
  final int? salePrice;
  final String? location;

  TestdriveListEntity(
      {this.id,
      this.cars,
      this.realEstates,
      this.categories,
      this.subCategory,
      this.title,
      this.price,
      this.uploadedFiles,
      this.salePrice,
      this.location});
}
