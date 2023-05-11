import '../../data/models/product_list_model.dart';

class FilterEntity {
  final List<Brands>? brands;
  final List<Brands>? cmakers;
  final List<Brands>? cmodels;
  List<Brands>? categories;
  List<Brands>? sellers;
  Price? price;
  Price? kmDriven;
  Price? year;
  Price? rooms;
  Price? buildArea;
  final FeatureType? featureType;
  final PropertyType? propertyType;

  FilterEntity(
      {this.brands,
      this.cmakers,
      this.cmodels,
      this.buildArea,
      this.categories,
      this.kmDriven,
      this.price,
      this.rooms,
      this.sellers,
      this.featureType,
      this.year,
      this.propertyType});
}
