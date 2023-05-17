import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/product_details/domain/entities/car_detail_entity.dart';
import '../../../../core/resource/data_state/data_state.dart';

abstract class CarDetailRepo {
  Future<DataState<CarDetailEntity>> getCarDetails(RequestParams params);
}
