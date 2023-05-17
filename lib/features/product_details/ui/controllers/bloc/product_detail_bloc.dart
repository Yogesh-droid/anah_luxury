import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/product_details/domain/entities/car_detail_entity.dart';
import 'package:anah_luxury/features/product_details/domain/usecases/car_details_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final CarDetailUsecase carDetailUsecase;
  ProductDetailBloc({required this.carDetailUsecase})
      : super(ProductDetailInitial()) {
    on<ProductDetailEvent>((event, emit) async {
      if (event is GetCarDetailEvent) {
        try {
          final DataState<CarDetailEntity> dataState =
              await carDetailUsecase.call(RequestParams(
                  url:
                      // "${baseUrl}v1/app/products/carProductBySlug/${event.slug}?country=60c9a6428729de2bf7ad0ebe",
                      "${baseUrl}v1/app/products/carProductBySlug/vis-test-fet-now?country=60c9a6428729de2bf7ad0ebe",
                  apiMethods: ApiMethods.get));

          if (dataState.data != null) {
            emit(CarDetailFetched(carDetailEntity: dataState.data!));
          } else {
            emit(CarDetailError(exception: dataState.exception!));
          }
        } on Exception catch (e) {
          emit(CarDetailError(exception: e));
        }
      }
    });
  }
}
