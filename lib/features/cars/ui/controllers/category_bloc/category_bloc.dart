import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/cars/domain/entity/category_entity.dart';
import 'package:anah_luxury/features/cars/domain/usecases/category_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'category_event.dart';
part 'category_state.dart';

class CarsAndPropCategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUsecase categoryUsecase;
  final List<CategoryEntity> carsCategoryEntity = [];

  CarsAndPropCategoryBloc({required this.categoryUsecase})
      : super(CarsCategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetCarCategoryEvent) {
        try {
          final DataState<List<CategoryEntity>> categorylist =
              await categoryUsecase.call(RequestParams(
                  url: "${baseUrl}get-children/cars",
                  apiMethods: ApiMethods.get));
          for (var category in categorylist.data!) {
            carsCategoryEntity.add(category);
          }
          emit(CategoryCarsSuccessState(categoryList: carsCategoryEntity));
        } on Exception catch (e) {
          emit(CategoryCarsErrorState(exception: e));
        }
      }
    });
  }
}
