// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/home/domain/entities/featured_luxury_residence_res_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/featured_luxury_residence_repo.dart';

class FeaturedLuxuryResidenceUsecase implements Usecase {
  final FeaturedLuxuryResidenceRepo featuredLuxuryResidenceRepo;
  FeaturedLuxuryResidenceUsecase({
    required this.featuredLuxuryResidenceRepo,
  });
  @override
  Future<
      DataState<
          Map<ResidenceCategory, List<FeaturedLuxuryResidenceResEntity>>>> call(
      params) async {
    return await featuredLuxuryResidenceRepo.getFeaturedLuxuryResidence(params);
  }
}
