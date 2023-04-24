// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data/models/feature_luxury_cars_model.dart';

class FeaturedLuxuryCarsEntity {
  final String? sId;
  final String? title;
  final String? slug;
  final List<UploadedFiles>? uploadedFiles;
  final double? salePrice;
  final List<Currency>? currency;
  FeaturedLuxuryCarsEntity({
    this.sId,
    this.title,
    this.slug,
    this.uploadedFiles,
    this.salePrice,
    this.currency,
  });
}
