import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/cars/domain/entity/category_entity.dart';

abstract class CategoryRepo {
  Future<DataState<List<CategoryEntity>>> getCategory(RequestParams params);
}
