import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';


abstract class ProductListRepo{
  Future<DataState<Map<ProductStateType,dynamic>>> getProductList(RequestParams params);
}

enum ProductStateType{productList,filters}