import '../../data/models/car_detail_model.dart';

class PropertyDetailEntity {
  final bool? success;
  final String? title;
  final String? propertyType;
  final String? price;
  final List<All>? bedroom;
  final List<All>? hall;
  final List<All>? kitchen;
  final List<All>? diningRoom;
  final List<All>? livingRoom;
  final List<All>? garden;
  final List<All>? outside;
  final String? bookingPrice;
  final List<OverviewType>? propertyOverView;
  final List<String>? otherFeatures;
  final String? seller;

  PropertyDetailEntity(
      {this.success,
      this.title,
      this.propertyType,
      this.price,
      this.bedroom,
      this.hall,
      this.kitchen,
      this.diningRoom,
      this.livingRoom,
      this.garden,
      this.outside,
      this.bookingPrice,
      this.propertyOverView,
      this.otherFeatures,
      this.seller});
}
