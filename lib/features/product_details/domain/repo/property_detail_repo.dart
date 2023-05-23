import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/product_details/domain/entities/property_detail_entity.dart';

abstract class PropertyDetailRepo {
  Future<DataState<PropertyDetailEntity>> getPropertyDetails(
      RequestParams params);
}
