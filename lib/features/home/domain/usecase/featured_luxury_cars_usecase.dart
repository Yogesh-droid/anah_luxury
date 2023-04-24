// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/home/domain/entities/featured_luxury_cars_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/featured_luxury_cars_repo.dart';

class FeaturedLuxuryCarsUsecase extends Usecase {
  final FeaturedLuxuryCarsRepo featuredLuxuryCarsRepo;
  FeaturedLuxuryCarsUsecase({
    required this.featuredLuxuryCarsRepo,
  });
  @override
  Future<DataState<Map<CarsCategory, List<FeaturedLuxuryCarsEntity>>>> call(
      params) async {
    return await featuredLuxuryCarsRepo.getFeaturedLuxuryCars(params);
  }
}
