import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/domain/entities/home_page_cat_res_entity.dart';

abstract class HomePageCatRepo {
  Future<DataState<List<HomePageCatResEntity>>> getHomePageCat(
      RequestParams params);
}
