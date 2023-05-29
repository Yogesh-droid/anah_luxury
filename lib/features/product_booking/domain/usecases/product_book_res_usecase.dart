import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/product_booking/domain/entities/product_book_res_entity.dart';
import 'package:anah_luxury/features/product_booking/domain/repo/product_book_repo.dart';

class ProductBookResUsecase extends Usecase {
  final ProductBookRepo productBookRepo;

  ProductBookResUsecase(this.productBookRepo);
  @override
  Future<DataState<ProductBookResEntity>> call(params) async {
    return await productBookRepo.bookProduct(params);
  }
}
