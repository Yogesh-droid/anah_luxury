import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/product_listing/domain/entities/filter_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_list_entity.dart';
import '../../../domain/repo/product_list_repo.dart';
import '../../../domain/usecases/product_list_usecase.dart';
part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListUsecase productListUsecase;
  List<ProductListEntity>? productList;
  FilterEntity? filterList;
  Map<String, String> selectedFilterList = {};
  String filterQuery = '';

  ProductListBloc({required this.productListUsecase})
      : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) async {
      try {
        if (event is GetProductListEvent) {
          final DataState<Map<ProductStateType, dynamic>> data =
              await productListUsecase.call(RequestParams(
                  url:
                      "${baseUrl}v1/app/getProducts?${event.query}$filterQuery",
                  apiMethods: ApiMethods.get));
          if (data.data != null) {
            productList = data.data![ProductStateType.productList] ?? [];
            filterList = data.data![ProductStateType.filters];

            if (productList != null && filterList != null) {
              emit(ProductListFinal(
                  productList: productList!, filtersList: filterList!));
            }
          } else {
            emit(ProductListError(exception: Exception("Data is null")));
          }
        }
      } on Exception catch (e) {
        emit(ProductListError(exception: e));
      }
    });
  }
}
