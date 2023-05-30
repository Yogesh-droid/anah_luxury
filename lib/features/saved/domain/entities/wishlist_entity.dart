import '../../data/models/user_wishlist_model.dart';

class WishListEntity {
  final String? title;
  final String? location;
  final String? categories;
  final String? subCategory;
  final int? purchaseYear;
  final int? mileage;
  final String? propertyType;
  final String? uploadedFiles;
  final int? price;
  final int? salePrice;
  final String? slug;
  final List<ProductCountryAttributes>? productCountryAttributes;
  final Brand? brand;
  final String? id;

  WishListEntity(
      {this.title,
      this.location,
      this.categories,
      this.subCategory,
      this.purchaseYear,
      this.mileage,
      this.propertyType,
      this.uploadedFiles,
      this.price,
      this.salePrice,
      this.slug,
      this.productCountryAttributes,
      this.brand,
      this.id});
}
