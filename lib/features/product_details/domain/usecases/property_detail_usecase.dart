import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/product_details/domain/entities/property_detail_entity.dart';
import 'package:anah_luxury/features/product_details/domain/repo/property_detail_repo.dart';

class PropertyDetailUsecase extends Usecase {
  final PropertyDetailRepo propertyDetailRepo;

  PropertyDetailUsecase(this.propertyDetailRepo);
  @override
  Future<DataState<PropertyDetailEntity>> call(params) async {
    return await propertyDetailRepo.getPropertyDetails(params);
  }
}
