import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/product_booking/domain/entities/product_book_res_entity.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/product_booking/domain/repo/product_book_repo.dart';
import 'package:dio/dio.dart';

import '../models/produt_book_res_model.dart';

class ProductBookRepoImpl extends ProductBookRepo {
  final NetworkManager networkManager;

  ProductBookRepoImpl({required this.networkManager});
  @override
  Future<DataState<ProductBookResEntity>> bookProduct(
      RequestParams params) async {
    Response? response;
    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response!.data != null) {
        final value = ProdutBookResModel.fromJson(response.data);
        return DataSuccess(data: value);
      } else {
        return DataError(exception: Exception(response.statusMessage));
      }
    } on Exception catch (e) {
      return DataError(exception: Exception("Some server error occured $e"));
    }
  }
}
