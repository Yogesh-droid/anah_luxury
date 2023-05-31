import '../../domain/entities/buying_list_entity.dart';

class UserBuyingListModel {
  bool? success;
  List<CartF>? cartF;

  UserBuyingListModel({this.success, this.cartF});

  UserBuyingListModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    cartF = json["cartF"] == null
        ? null
        : (json["cartF"] as List).map((e) => CartF.fromJson(e)).toList();
  }
}

class CartF {
  Product? product;
  Country? country;
  User? user;
  List<dynamic>? productCountryAttributes;
  int? quantity;
  String? id;

  CartF(
      {this.product,
      this.country,
      this.user,
      this.productCountryAttributes,
      this.quantity,
      this.id});

  CartF.fromJson(Map<String, dynamic> json) {
    product =
        json["product"] == null ? null : Product.fromJson(json["product"]);
    country =
        json["country"] == null ? null : Country.fromJson(json["country"]);
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    productCountryAttributes = json["productCountryAttributes"] ?? [];
    quantity = json["quantity"];
    id = json["_id"];
  }
}

class User {
  String? lastName;
  String? mobile;
  String? source;
  String? type;
  String? status;
  String? gender;
  String? profilePic;
  String? country;
  String? language;
  String? isVerified;
  String? sId;
  String? name;
  String? email;
  String? tier;
  bool? guestUser;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? tokens;
  String? dob;
  String? id;

  User(
      {this.lastName,
      this.mobile,
      this.source,
      this.type,
      this.status,
      this.gender,
      this.profilePic,
      this.country,
      this.language,
      this.isVerified,
      this.sId,
      this.name,
      this.email,
      this.tier,
      this.guestUser,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.tokens,
      this.dob,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    lastName = json["last_name"];
    mobile = json["mobile"];
    source = json["source"];
    type = json["type"];
    status = json["status"];
    gender = json["gender"];
    profilePic = json["profilePic"];
    country = json["country"];
    language = json["language"];
    isVerified = json["isVerified"];
    sId = json["_id"];
    name = json["name"];
    email = json["email"];
    tier = json["tier"];
    guestUser = json["guestUser"];
    password = json["password"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    tokens = json["tokens"];
    dob = json["dob"];
    id = json["id"];
  }
}

class Country {
  String? status;
  String? id;
  String? name;
  String? code;
  String? flag;
  String? currencyName;
  String? currencySymbol;
  String? createdAt;
  String? updatedAt;
  int? v;

  Country(
      {this.status,
      this.id,
      this.name,
      this.code,
      this.flag,
      this.currencyName,
      this.currencySymbol,
      this.createdAt,
      this.updatedAt,
      this.v});

  Country.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    id = json["_id"];
    name = json["name"];
    code = json["code"];
    flag = json["flag"];
    currencyName = json["currencyName"];
    currencySymbol = json["currencySymbol"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }
}

class Product extends BuyingListEntity {
  Product({
    String? title,
    String? uploadedFiles,
    String? description,
    String? slug,
    String? id,
    int? price,
    int? salePrice,
    List<dynamic>? productCountryAttributes,
    String? brand,
    String? categories,
    String? subCategory,
    int? kmDriven,
    List<dynamic>? addedAttributes,
  }) : super(
            addedAttributes: addedAttributes,
            brand: brand,
            categories: categories,
            description: description,
            id: id,
            kmDriven: kmDriven,
            price: price,
            productCountryAttributes: productCountryAttributes,
            salePrice: salePrice,
            slug: slug,
            subCategory: subCategory,
            title: title,
            uploadedFiles: uploadedFiles);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json["title"],
      uploadedFiles: json["uploadedFiles"],
      description: json["description"],
      slug: json["slug"],
      id: json["_id"],
      price: json["price"],
      salePrice: json["salePrice"],
      productCountryAttributes: json["ProductCountryAttributes"] ?? [],
      brand: json["brand"],
      categories: json["categories"],
      subCategory: json["subCategory"],
      kmDriven: json["kmDriven"],
      addedAttributes: json["addedAttributes"] ?? [],
    );
  }
}
