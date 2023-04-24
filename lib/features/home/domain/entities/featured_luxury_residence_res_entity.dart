// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data/models/featured_luxury_residence_res_model.dart';

class FeaturedLuxuryResidenceResEntity {
  final String? sId;
  final String? title;
  final String? slug;
  final List<UploadedFiles>? uploadedFiles;
  final double? salePrice;
  final List<Currency>? currency;
  FeaturedLuxuryResidenceResEntity({
    this.sId,
    this.title,
    this.slug,
    this.uploadedFiles,
    this.salePrice,
    this.currency,
  });
}
