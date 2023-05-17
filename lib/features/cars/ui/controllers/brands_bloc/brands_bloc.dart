// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/features/cars/domain/entity/brands_entity.dart';
import 'package:anah_luxury/features/cars/domain/usecases/brands_usecase.dart';

part 'brands_event.dart';
part 'brands_state.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final BrandsUsecase brandsUsecase;
  final List<BrandsEntity> brandsList = [];
  BrandsBloc({required this.brandsUsecase}) : super(BrandsInitial()) {
    on<BrandsEvent>((event, emit) async {
      if (event is GetBrandsEvent) {
        try {
          final DataState<List<BrandsEntity>> brands = await brandsUsecase.call(
              RequestParams(
                  url: "${baseUrl}client/brandsLogo",
                  apiMethods: ApiMethods.get));

          for (var element in brands.data!) {
            brandsList.add(element);
          }

          emit(BrandsSuccessState(brandsList: brandsList));
        } on Exception catch (e) {
          emit(BrandsErrorState(exception: e));
        }
      }
    });
  }
}
