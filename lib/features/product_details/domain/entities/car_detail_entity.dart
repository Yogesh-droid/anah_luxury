import '../../data/models/car_detail_model.dart';

class CarDetailEntity {
  final bool? success;
  final String? title;
  final String? price;
  final List<All>? all;
  final List<All>? exterior;
  final List<All>? interior;
  final List<All>? wheel;
  final List<All>? engine;
  final CarOverView? carOverView;
  final CarSpecification? carSpecification;
  final List<UploadedFiles>? uploadedFiles;
  final String? seller;

  CarDetailEntity(
      {this.success,
      this.title,
      this.price,
      this.all,
      this.exterior,
      this.interior,
      this.wheel,
      this.engine,
      this.carOverView,
      this.carSpecification,
      this.uploadedFiles,
      this.seller});
}
