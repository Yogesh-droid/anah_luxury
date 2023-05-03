import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/product_listing/domain/entities/product_list_entity.dart';
import 'package:anah_luxury/features/product_listing/domain/repo/product_list_repo.dart';

class ProductListUsecase extends Usecase{
  final ProductListRepo productListRepo;

  ProductListUsecase({required this.productListRepo});
  @override
  Future<DataState<List<ProductListEntity>>> call(params) async {
      return await productListRepo.getProductList(params);
  }
}