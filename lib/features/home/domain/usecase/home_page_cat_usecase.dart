// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/home/domain/entities/home_page_cat_res_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/home_page_cat_repo.dart';

class HomePageCatUsecase extends Usecase {
  final HomePageCatRepo homePageCatRepo;
  HomePageCatUsecase({
    required this.homePageCatRepo,
  });
  @override
  Future<DataState<List<HomePageCatResEntity>>> call(params) async {
    return await homePageCatRepo.getHomePageCat(params);
  }
}
