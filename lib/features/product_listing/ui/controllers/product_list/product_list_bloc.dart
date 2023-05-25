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

  ProductListBloc({required this.productListUsecase})
      : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) async {
      try {
        if (event is GetProductListEvent) {
          final DataState<Map<ProductStateType, dynamic>> data =
              await productListUsecase.call(RequestParams(
                  url: "${baseUrl}v1/app/getProducts?${event.query}",
                  apiMethods: ApiMethods.get,
                  header: {
                "Authorization":
                    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1ZlcmlmaWVkIjoxLCJwZXJtaXNzaW9ucyI6W3sic3RhdHVzIjoiQWN0aXZlIiwiX2lkIjoiNjEyNWUwZDgwZTI0NDkxZmMwOWIyZWNkIiwicGVybWlzc2lvbktleSI6ImFsbCJ9XSwiYnJhbmRzIjpbeyJfaWQiOiI2NDJhYjIyMmY3ZTRhZjFmNDg4NGNlNTIiLCJuYW1lIjoiTWFuaGF0dGFuIEFwYXJ0bWVudCJ9LHsiX2lkIjoiNjQyYWIyYjhmN2U0YWYxZjQ4ODRjZTU4IiwibmFtZSI6IkhvdXNlIG9mIENhcnMgJiBSZWFsIEVzdGF0ZSJ9LHsiX2lkIjoiNjQyYWIxNWFmN2U0YWYxZjQ4ODRjZTRjIiwibmFtZSI6IkJ1dGxlciBBdXRvIEdyb3VwIn1dLCJzdGF0dXMiOiJBY3RpdmUiLCJfaWQiOiI2MTI1ZWUyYWE2Nzk5MDJkOTA5MTNmMmEiLCJmaXJzdF9uYW1lIjoiTXVuZWV0IiwibGFzdF9uYW1lIjoiRGhhbmtlciIsImVtYWlsIjoibXVuZWV0LmRoYW5rZXJAb21sb2dpYy5jb20iLCJwYXNzd29yZCI6IiQyYSQxMCQxaUxLY1J0QzhPQy5weDhMYVhzTWNlSWRrUGZxc0ltLmtrUjgwUUszbm1wY2R0MDJJYmIyVyIsIm1vYmlsZSI6Iis5MS05OTExMDg3MTc3Iiwicm9sZSI6eyJzdGF0dXMiOiJBY3RpdmUiLCJfaWQiOiI2M2ZjNGQxOGVmOGQ3NTM3MDQxODNlY2UiLCJuYW1lIjoiU3VwZXIgQWRtaW4iLCJyb2xlS2V5Ijoic3VwZXJBZG1pbiJ9LCJpYXQiOjE2ODI0MDE5MjYsImV4cCI6MTY4MzAwNjcyNn0.pFQUeUgI-nP6SJVh5NEwnyR0eKB6-x-ICte31z-PZ0I"
              }));
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
