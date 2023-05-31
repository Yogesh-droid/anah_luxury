class BuyingListEntity {
  final String? title;
  final String? uploadedFiles;
  final String? description;
  final String? slug;
  final String? id;
  final int? price;
  final int? salePrice;
  final List<dynamic>? productCountryAttributes;
  final String? brand;
  final String? categories;
  final String? subCategory;
  final int? kmDriven;
  final List<dynamic>? addedAttributes;

  BuyingListEntity(
      {this.title,
      this.uploadedFiles,
      this.description,
      this.slug,
      this.id,
      this.price,
      this.salePrice,
      this.productCountryAttributes,
      this.brand,
      this.categories,
      this.subCategory,
      this.kmDriven,
      this.addedAttributes});
}
