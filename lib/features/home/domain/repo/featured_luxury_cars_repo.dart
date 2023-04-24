import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/domain/entities/featured_luxury_cars_entity.dart';

enum CarsCategory { featured, luxury }

abstract class FeaturedLuxuryCarsRepo {
  Future<DataState<Map<CarsCategory, List<FeaturedLuxuryCarsEntity>>>>
      getFeaturedLuxuryCars(RequestParams params);
}
