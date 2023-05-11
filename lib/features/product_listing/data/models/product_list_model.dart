import 'package:anah_luxury/features/product_listing/domain/entities/filter_entity.dart';
import 'package:anah_luxury/features/product_listing/domain/entities/product_list_entity.dart';

class ProductListModel {
  bool? success;
  List<Products>? products;
  int? count;
  Filters? filters;

  ProductListModel({this.success, this.products, this.count, this.filters});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    count = json['count'];
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    return data;
  }
}

class Products extends ProductListEntity {
  Products(
      {Cars? cars,
      RealEstates? realEstates,
      List<AllowCountries>? allowCountries,
      String? customerType,
      String? productType,
      String? sId,
      String? title,
      String? slug,
      int? price,
      List<UploadedFiles>? uploadedFiles,
      Brand? brand,
      String? sku,
      AllowCountries? prodCurrency,
      int? salePrice,
      int? quantity,
      String? isFeatured,
      String? isnew,
      String? isPopular,
      String? id,
      String? stockStatus,
      String? countryId,
      String? productId,
      String? isDefault})
      : super(
            allowCountries: allowCountries,
            brand: brand,
            cars: cars,
            countryId: countryId,
            customerType: customerType,
            id: id,
            isDefault: isDefault,
            isFeatured: isFeatured,
            isPopular: isPopular,
            isnew: isnew,
            price: price,
            prodCurrency: prodCurrency,
            productId: productId,
            productType: productType,
            quantity: quantity,
            realEstates: realEstates,
            sId: sId,
            salePrice: salePrice,
            sku: sku,
            slug: slug,
            stockStatus: stockStatus,
            title: title,
            uploadedFiles: uploadedFiles);

  factory Products.fromJson(Map<String, dynamic> json) {
    List<AllowCountries> allowCountries1 = [];
    List<UploadedFiles> uploadedFiles1 = [];

    if (json['allowCountries'] != null) {
      json['allowCountries'].forEach((v) {
        allowCountries1.add(AllowCountries.fromJson(v));
      });
    }

    if (json['uploadedFiles'] != null) {
      json['uploadedFiles'].forEach((v) {
        uploadedFiles1.add(UploadedFiles.fromJson(v));
      });
    }
    return Products(
        cars: json['cars'] != null ? Cars.fromJson(json['cars']) : null,
        realEstates: json['realEstates'] != null
            ? RealEstates.fromJson(json['realEstates'])
            : null,
        allowCountries: allowCountries1,
        customerType: json['customerType'],
        productType: json['productType'],
        sId: json['_id'],
        title: json['title'],
        slug: json['slug'],
        price: json['price'],
        uploadedFiles: uploadedFiles1,
        brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
        sku: json['sku'],
        prodCurrency: json['prodCurrency'] != null
            ? AllowCountries.fromJson(json['prodCurrency'])
            : null,
        salePrice: json['salePrice'],
        quantity: json['quantity'],
        isFeatured: json['isFeatured'],
        isnew: json['isnew'],
        isPopular: json['isPopular'],
        id: json['id'],
        stockStatus: json['stockStatus'],
        countryId: json['country_id'],
        productId: json['product_id'],
        isDefault: json['isDefault']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cars != null) {
      data['cars'] = cars!.toJson();
    }
    if (realEstates != null) {
      data['realEstates'] = realEstates!.toJson();
    }
    if (allowCountries != null) {
      data['allowCountries'] = allowCountries!.map((v) => v.toJson()).toList();
    }
    data['customerType'] = customerType;
    data['productType'] = productType;
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['price'] = price;
    if (uploadedFiles != null) {
      data['uploadedFiles'] = uploadedFiles!.map((v) => v.toJson()).toList();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['sku'] = sku;
    if (prodCurrency != null) {
      data['prodCurrency'] = prodCurrency!.toJson();
    }
    data['salePrice'] = salePrice;
    data['quantity'] = quantity;
    data['isFeatured'] = isFeatured;
    data['isnew'] = isnew;
    data['isPopular'] = isPopular;
    data['id'] = id;
    data['stockStatus'] = stockStatus;
    data['country_id'] = countryId;
    data['product_id'] = productId;
    data['isDefault'] = isDefault;
    return data;
  }
}

class Cars {
  String? warranty;
  int? purchaseYear;
  int? mileage;
  String? interiorColor;
  String? exteriorColor;

  Cars(
      {this.warranty,
      this.purchaseYear,
      this.mileage,
      this.interiorColor,
      this.exteriorColor});

  Cars.fromJson(Map<String, dynamic> json) {
    warranty = json['warranty'];
    purchaseYear = json['purchaseYear'];
    mileage = json['mileage'];
    interiorColor = json['interiorColor'];
    exteriorColor = json['exteriorColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['warranty'] = warranty;
    data['purchaseYear'] = purchaseYear;
    data['mileage'] = mileage;
    data['interiorColor'] = interiorColor;
    data['exteriorColor'] = exteriorColor;
    return data;
  }
}

class RealEstates {
  String? propertyType;
  int? buildArea;
  int? rooms;
  int? bathrooms;
  String? location;

  RealEstates(
      {this.propertyType,
      this.buildArea,
      this.rooms,
      this.bathrooms,
      this.location});

  RealEstates.fromJson(Map<String, dynamic> json) {
    propertyType = json['propertyType'];
    buildArea = json['buildArea'];
    rooms = json['rooms'];
    bathrooms = json['bathrooms'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['propertyType'] = propertyType;
    data['buildArea'] = buildArea;
    data['rooms'] = rooms;
    data['bathrooms'] = bathrooms;
    data['location'] = location;
    return data;
  }
}

class AllowCountries {
  String? sId;
  String? currencyName;
  String? currencySymbol;

  AllowCountries({this.sId, this.currencyName, this.currencySymbol});

  AllowCountries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    currencyName = json['currencyName'];
    currencySymbol = json['currencySymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['currencyName'] = currencyName;
    data['currencySymbol'] = currencySymbol;
    return data;
  }
}

class UploadedFiles {
  String? sId;
  String? mimetype;
  String? fileUrl;

  UploadedFiles({this.sId, this.mimetype, this.fileUrl});

  UploadedFiles.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mimetype = json['mimetype'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['mimetype'] = mimetype;
    data['fileUrl'] = fileUrl;
    return data;
  }
}

class Brand {
  String? sId;
  String? name;

  Brand({this.sId, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Filters extends FilterEntity {
  Filters(
      {List<Brands>? brands,
      List<Brands>? cmakers,
      List<Brands>? cmodels,
      List<Brands>? categories,
      List<Brands>? sellers,
      Price? price,
      Price? kmDriven,
      Price? year,
      Price? rooms,
      Price? buildArea,
      FeatureType? featureType,
      PropertyType? propertyType})
      : super(
            brands: brands,
            buildArea: buildArea,
            categories: categories,
            cmakers: cmakers,
            cmodels: cmodels,
            featureType: featureType,
            kmDriven: kmDriven,
            price: price,
            propertyType: propertyType,
            rooms: rooms,
            sellers: sellers,
            year: year);

  factory Filters.fromJson(Map<String, dynamic> json) {
    List<Brands>? brands1 = [];
    List<Brands>? cmakers1 = [];
    List<Brands>? cmodels1 = [];
    List<Brands>? categories1 = [];
    List<Brands>? sellers1 = [];

    if (json['brands'] != null) {
      json['brands'].forEach((v) {
        brands1.add(Brands.fromJson(v));
      });
    }

    if (json['cmakers'] != null) {
      json['cmakers'].forEach((v) {
        cmakers1.add(Brands.fromJson(v));
      });
    }

    if (json['cmodels'] != null) {
      json['cmodels'].forEach((v) {
        cmodels1.add(Brands.fromJson(v));
      });
    }

    if (json['categories'] != null) {
      json['categories'].forEach((v) {
        categories1.add(Brands.fromJson(v));
      });
    }

    if (json['sellers'] != null) {
      json['sellers'].forEach((v) {
        sellers1.add(Brands.fromJson(v));
      });
    }

    return Filters(
        brands: brands1,
        categories: categories1,
        cmakers: cmakers1,
        cmodels: cmodels1,
        sellers: sellers1,
        price: json['price'] != null ? Price.fromJson(json['price']) : null,
        year: json['year'] != null ? Price.fromJson(json['year']) : null,
        kmDriven:
            json['kmDriven'] != null ? Price.fromJson(json['kmDriven']) : null,
        rooms: json['room'] != null ? Price.fromJson(json['room']) : null,
        buildArea: json['buildArea'] != null
            ? Price.fromJson(json['buildArea'])
            : null,
        featureType: json['featureType'] != null
            ? FeatureType.fromJson(json['featureType'])
            : null,
        propertyType: json['propertyType'] != null
            ? PropertyType.fromJson(json['propertyType'])
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    if (cmakers != null) {
      data['cmakers'] = cmakers!.map((v) => v.toJson()).toList();
    }
    if (cmodels != null) {
      data['cmodels'] = cmodels!.map((v) => v.toJson()).toList();
    }
    if (featureType != null) {
      data['featureType'] = featureType!.toJson();
    }
    if (propertyType != null) {
      data['propertyType'] = propertyType!.toJson();
    }
    return data;
  }
}

class Brands {
  String? sId;
  String? name;
  String? slug;

  Brands({this.sId, this.name, this.slug});

  Brands.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class FeatureType {
  String? featured;
  String? new1;
  String? popular;

  FeatureType({this.featured, this.new1, this.popular});

  FeatureType.fromJson(Map<String, dynamic> json) {
    featured = json['Featured'];
    new1 = json['New'];
    popular = json['Popular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Featured'] = featured;
    data['New'] = new1;
    data['Popular'] = popular;
    return data;
  }
}

class PropertyType {
  String? fullyFurnished;
  String? semiFurnished;
  String? unFurnished;

  PropertyType({this.fullyFurnished, this.semiFurnished, this.unFurnished});

  PropertyType.fromJson(Map<String, dynamic> json) {
    fullyFurnished = json['Fully-Furnished'];
    semiFurnished = json['Semi-Furnished'];
    unFurnished = json['UnFurnished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Fully-Furnished'] = fullyFurnished;
    data['Semi-Furnished'] = semiFurnished;
    data['UnFurnished'] = unFurnished;
    return data;
  }
}

class Price {
  int? start;
  int? end;
  Price({this.end, this.start});

  Price.fromJson(Map<String, dynamic> json) {
    start = json["start"];
    end = json["end"];
  }
}
