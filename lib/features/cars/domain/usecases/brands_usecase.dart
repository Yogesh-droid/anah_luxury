// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/cars/domain/entity/brands_entity.dart';
import 'package:anah_luxury/features/cars/domain/repo/brands_repo.dart';

class BrandsUsecase extends Usecase {
  final BrandsRepo brandsRepo;
  BrandsUsecase({
    required this.brandsRepo,
  });

  @override
  Future<DataState<List<BrandsEntity>>> call(params) {
    return brandsRepo.getBrandsList(params);
  }
}
