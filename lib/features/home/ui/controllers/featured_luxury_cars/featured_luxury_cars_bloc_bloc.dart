import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/domain/entities/featured_luxury_cars_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/featured_luxury_cars_repo.dart';
import 'package:anah_luxury/features/home/domain/usecase/featured_luxury_cars_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_luxury_cars_bloc_event.dart';
part 'featured_luxury_cars_bloc_state.dart';

class FeaturedLuxuryCarsBlocBloc
    extends Bloc<FeaturedLuxuryCarsBlocEvent, FeaturedLuxuryCarsBlocState> {
  final FeaturedLuxuryCarsUsecase featuredLuxuryCarsUsecase;
  List<FeaturedLuxuryCarsEntity> featuredCars = [];
  List<FeaturedLuxuryCarsEntity> luxuryCars = [];
  FeaturedLuxuryCarsBlocBloc({required this.featuredLuxuryCarsUsecase})
      : super(FeaturedLuxuryCarsBlocInitial()) {
    on<FeaturedLuxuryCarsBlocEvent>((event, emit) async {
      if (event is GetFeaturedLuxuryCarsEvent) {
        DataState<Map<CarsCategory, List<FeaturedLuxuryCarsEntity>>> map =
            await featuredLuxuryCarsUsecase.call(RequestParams(
                url: "${baseUrl}client/luxuryCars",
                apiMethods: ApiMethods.get));

        if (map.data != null) {
          featuredCars = map.data![CarsCategory.featured]!;
          luxuryCars = map.data![CarsCategory.luxury]!;
          emit(FeaturedLuxuryCarsREsState(
              featuredCarsList: featuredCars, luxuryCarsList: luxuryCars));
        } else {
          emit(FeaturedluxuryCarsErrorState(err: map.exception));
        }
      }
    });
  }
}
