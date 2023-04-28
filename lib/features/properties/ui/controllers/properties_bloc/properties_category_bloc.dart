// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:anah_luxury/features/cars/domain/usecases/category_usecase.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/resource/data_state/data_state.dart';
import '../../../../../core/resource/request_params/request_params.dart';
import '../../../../cars/domain/entity/category_entity.dart';

part 'properties_category_event.dart';
part 'properties_category_state.dart';

class PropertiesCategoryBloc
    extends Bloc<PropertiesCategoryEvent, PropertiesCategoryState> {
  final CategoryUsecase categoryUsecase;
  final List<CategoryEntity> propertiesCategoryEntity = [];
  PropertiesCategoryBloc(
    this.categoryUsecase,
  ) : super(PropertiesCategoryInitial()) {
    on<PropertiesCategoryEvent>((event, emit) async {
      if (event is GetPropertiesCategoryEvent) {
        try {
          final DataState<List<CategoryEntity>> categorylist =
              await categoryUsecase.call(const RequestParams(
                  url: "${baseUrl}get-children/real-estate",
                  apiMethods: ApiMethods.get));
          for (var category in categorylist.data!) {
            propertiesCategoryEntity.add(category);
          }
          emit(PropertiesCategorySuccess(
              categoryList: propertiesCategoryEntity));
        } on Exception catch (e) {
          emit(PropertyErrorState(exception: e));
        }
      }
    });
  }
}
