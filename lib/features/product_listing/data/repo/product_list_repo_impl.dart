import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/features/product_listing/data/models/product_list_model.dart';
import 'package:anah_luxury/features/product_listing/domain/entities/product_list_entity.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/product_listing/domain/repo/product_list_repo.dart';
import 'package:dio/dio.dart';

class ProductListRepoImpl implements ProductListRepo{
  final NetworkManager networkManager;

  ProductListRepoImpl({required this.networkManager});
  @override
  Future<DataState<List<ProductListEntity>>> getProductList(RequestParams params) async {
    final Response? response;
    try {
      response = await networkManager.makeNetworkRequest(params);
      if(response!=null){
        print(response.data);
        if(response.statusCode == 200){
          final value = ProductListModel.fromJson(response.data);
          return DataSuccess(data: value.products);
        }else{
        return DataError(exception: Exception(response.statusMessage));  
        }
      }else{
        return DataError(exception: Exception("Data is not received from server"));
      }
    } on Exception catch (e) {
      return DataError(exception: Exception("Some Server Error"));
    }
  }

}