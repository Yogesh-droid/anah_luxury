import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/domain/entities/home_page_cat_res_entity.dart';
import 'package:anah_luxury/features/home/domain/usecase/home_page_cat_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_category_bloc_event.dart';
part 'home_page_category_bloc_state.dart';

class HomePageCategoryBlocBloc
    extends Bloc<HomePageCategoryBlocEvent, HomePageCategoryBlocState> {
  final HomePageCatUsecase catUsecase;
  final List<HomePageCatResEntity> categoryList = [];
  HomePageCategoryBlocBloc(this.catUsecase)
      : super(HomePageCategoryBlocInitial()) {
    on<HomePageCategoryBlocEvent>((event, emit) async {
      if (event is GetHomePageCatEvent) {
        DataState<List<HomePageCatResEntity>> catState = await catUsecase.call(
            RequestParams(
                url: "${baseUrl}client/homepage-categories",
                apiMethods: ApiMethods.get));

        if (catState.data != null) {
          for (var element in catState.data!) {
            categoryList.add(element);
          }
        }
      }
      emit(HomePageCategoryResultState(categoryList: categoryList));
    });
  }
}
