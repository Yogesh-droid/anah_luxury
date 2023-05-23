import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/product_details/domain/entities/property_detail_entity.dart';
import 'package:anah_luxury/features/product_details/domain/usecases/property_detail_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/resource/request_params/request_params.dart';
part 'property_detail_event.dart';
part 'property_detail_state.dart';

class PropertyDetailBloc
    extends Bloc<PropertyDetailEvent, PropertyDetailState> {
  final PropertyDetailUsecase propertyDetailUsecase;
  PropertyDetailBloc({required this.propertyDetailUsecase})
      : super(PropertyDetailInitial()) {
    on<PropertyDetailEvent>((event, emit) async {
      if (event is GetPropertyDetailEvent) {
        try {
          DataState<PropertyDetailEntity> dataState =
              await propertyDetailUsecase.call(RequestParams(
                  url:
                      "${baseUrl}v1/app/products/realEstateProductBySlug/${event.slug}?country=60c9a6428729de2bf7ad0ebe",
                  apiMethods: ApiMethods.get));

          if (dataState.data != null) {
            emit(PropertyDetailFetchedState(
                propertyDetailEntity: dataState.data!));
          } else {
            emit(PropertyDetailError(exception: dataState.exception!));
          }
        } on Exception catch (e) {
          emit(PropertyDetailError(exception: e));
        }
      }
    });
  }
}
