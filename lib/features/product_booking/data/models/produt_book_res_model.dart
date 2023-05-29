import 'package:anah_luxury/features/product_booking/domain/entities/product_book_res_entity.dart';

class ProdutBookResModel extends ProductBookResEntity {
  ProdutBookResModel({bool? success, String? message})
      : super(message: message, success: success);

  factory ProdutBookResModel.fromJson(Map<String, dynamic> json) {
    return ProdutBookResModel(
        success: json["success"], message: json["message"]);
  }
}
