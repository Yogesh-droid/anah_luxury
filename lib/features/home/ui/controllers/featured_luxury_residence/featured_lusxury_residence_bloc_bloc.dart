import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/domain/entities/featured_luxury_residence_res_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/featured_luxury_residence_repo.dart';
import 'package:anah_luxury/features/home/domain/usecase/featured_luxury_residence_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'featured_lusxury_residence_bloc_event.dart';
part 'featured_lusxury_residence_bloc_state.dart';

class FeaturedLusxuryResidenceBlocBloc extends Bloc<
    FeaturedLusxuryResidenceBlocEvent, FeaturedLusxuryResidenceBlocState> {
  List<FeaturedLuxuryResidenceResEntity> featuredApartments = [];
  List<FeaturedLuxuryResidenceResEntity> luxuryApartment = [];
  final FeaturedLuxuryResidenceUsecase featuredLuxuryResidenceUsecase;
  FeaturedLusxuryResidenceBlocBloc(
      {required this.featuredLuxuryResidenceUsecase})
      : super(FeaturedLusxuryResidenceBlocInitial()) {
    on<FeaturedLusxuryResidenceBlocEvent>((event, emit) async {
      if (event is GetFeaturedLuxuryResidenceEvent) {
        DataState<
                Map<ResidenceCategory, List<FeaturedLuxuryResidenceResEntity>>>
            _value = await featuredLuxuryResidenceUsecase.call(
                const RequestParams(
                    url: "$baseUrl/client/luxuryRealEstate",
                    apiMethods: ApiMethods.get));
        if (_value.data != null) {
          featuredApartments = _value.data![ResidenceCategory.feature]!;
          luxuryApartment = _value.data![ResidenceCategory.luxury]!;

          emit(FeaturedLuxuryResidenceResState(
              featuredApartments: featuredApartments,
              luxuryApartment: luxuryApartment));
        }
      }
    });
  }
}
