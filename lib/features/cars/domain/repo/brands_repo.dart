import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/cars/domain/entity/brands_entity.dart';

abstract class BrandsRepo {
  Future<DataState<List<BrandsEntity>>> getBrandsList(RequestParams params);
}
