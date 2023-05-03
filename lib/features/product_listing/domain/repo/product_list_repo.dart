import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/product_listing/domain/entities/product_list_entity.dart';

abstract class ProductListRepo{
  Future<DataState<List<ProductListEntity>>> getProductList(RequestParams params);
}