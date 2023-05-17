import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/product_details/domain/entities/car_detail_entity.dart';
import 'package:anah_luxury/features/product_details/domain/repo/car_detail_repo.dart';

class CarDetailUsecase implements Usecase {
  final CarDetailRepo carDetailRepo;

  CarDetailUsecase({required this.carDetailRepo});
  @override
  Future<DataState<CarDetailEntity>> call(params) async {
    return await carDetailRepo.getCarDetails(params);
  }
}
