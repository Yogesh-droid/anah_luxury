import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/domain/entities/featured_luxury_residence_res_entity.dart';

enum ResidenceCategory { feature, luxury }

abstract class FeaturedLuxuryResidenceRepo {
  Future<
          DataState<
              Map<ResidenceCategory, List<FeaturedLuxuryResidenceResEntity>>>>
      getFeaturedLuxuryResidence(RequestParams params);
}
