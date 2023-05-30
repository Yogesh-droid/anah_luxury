import 'package:anah_luxury/features/saved/domain/entities/wishlist_entity.dart';

class UserWishlistModel {
  bool? success;
  List<Wishlist>? wishlist;
  int? wishlistLength;

  UserWishlistModel({this.success, this.wishlist, this.wishlistLength});

  UserWishlistModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    wishlist = json["wishlist"] == null
        ? null
        : (json["wishlist"] as List).map((e) => Wishlist.fromJson(e)).toList();
    wishlistLength = json["wishlistLength"];
  }
}

class Wishlist {
  List<Product>? product;
  Country? country;
  User? user;
  String? id;

  Wishlist({this.product, this.country, this.user, this.id});

  Wishlist.fromJson(Map<String, dynamic> json) {
    product = json["Product"] == null
        ? null
        : (json["Product"] as List).map((e) => Product.fromJson(e)).toList();
    country =
        json["country"] == null ? null : Country.fromJson(json["country"]);
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    id = json["_id"];
  }
}

class User {
  String? sId;
  String? name;
  String? id;

  User({this.id, this.name, this.sId});

  User.fromJson(Map<String, dynamic> json) {
    sId = json["_id"];
    name = json["name"];
    id = json["id"];
  }
}

class Country {
  String? id;
  String? currencyName;
  String? currencySymbol;

  Country({this.id, this.currencyName, this.currencySymbol});

  Country.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    currencyName = json["currencyName"];
    currencySymbol = json["currencySymbol"];
  }
}

class Product extends WishListEntity {
  Product({
    String? title,
    String? location,
    String? categories,
    String? subCategory,
    int? purchaseYear,
    int? mileage,
    String? propertyType,
    String? uploadedFiles,
    int? price,
    int? salePrice,
    String? slug,
    List<ProductCountryAttributes>? productCountryAttributes,
    Brand? brand,
    String? id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json["title"],
        location: json["location"],
        categories: json["categories"],
        subCategory: json["subCategory"],
        purchaseYear: json["purchaseYear"],
        mileage: json["mileage"],
        propertyType: json["propertyType"],
        uploadedFiles: json["uploadedFiles"],
        price: json["price"],
        salePrice: json["salePrice"],
        slug: json["slug"],
        productCountryAttributes: json["ProductCountryAttributes"] == null
            ? null
            : (json["ProductCountryAttributes"] as List)
                .map((e) => ProductCountryAttributes.fromJson(e))
                .toList(),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        id: json["_id"]);
  }
}

class Brand {
  String? id;
  String? name;

  Brand({this.id, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
  }
}

class ProductCountryAttributes {
  List<dynamic>? attributes;
  String? sId;
  String? countryId;
  String? productId;
  int? price;
  int? salePrice;
  String? isDefault;
  String? id;

  ProductCountryAttributes(
      {this.attributes,
      this.sId,
      this.countryId,
      this.productId,
      this.price,
      this.salePrice,
      this.isDefault,
      this.id});

  ProductCountryAttributes.fromJson(Map<String, dynamic> json) {
    attributes = json["attributes"] ?? [];
    sId = json["_id"];
    countryId = json["country_id"];
    productId = json["product_id"];
    price = json["price"];
    salePrice = json["salePrice"];
    isDefault = json["isDefault"];
    id = json["id"];
  }
}
