import '../../data/models/product_list_model.dart';

class ProductListEntity {
  final Cars? cars;
  final RealEstates? realEstates;
  final List<AllowCountries>? allowCountries;
  final String? customerType;
  final String? productType;
  final String? sId;
  final String? title;
  final String? slug;
  final int? price;
  final List<UploadedFiles>? uploadedFiles;
  final Brand? brand;
  final String? sku;
  final AllowCountries? prodCurrency;
  final int? salePrice;
  final int? quantity;
  final String? isFeatured;
  final String? isnew;
  final String? isPopular;
  final String? id;
  final String? stockStatus;
  final String? countryId;
  final String? productId;
  final String? isDefault;

  ProductListEntity(
      {this.cars,
      this.realEstates,
      this.allowCountries,
      this.customerType,
      this.productType,
      this.sId,
      this.title,
      this.slug,
      this.price,
      this.uploadedFiles,
      this.brand,
      this.sku,
      this.prodCurrency,
      this.salePrice,
      this.quantity,
      this.isFeatured,
      this.isnew,
      this.isPopular,
      this.id,
      this.stockStatus,
      this.countryId,
      this.productId,
      this.isDefault});
}
