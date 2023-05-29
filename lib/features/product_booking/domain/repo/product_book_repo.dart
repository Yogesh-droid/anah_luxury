import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/product_booking/domain/entities/product_book_res_entity.dart';

abstract class ProductBookRepo {
  Future<DataState<ProductBookResEntity>> bookProduct(RequestParams params);
}
