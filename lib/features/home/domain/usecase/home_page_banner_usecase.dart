// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/home/domain/entities/home_page_banner_res_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/home_page_banner_repo.dart';

class HomePageBannerUsecase implements Usecase {
  final HomePageBannerRepo homePageBannerRepo;
  HomePageBannerUsecase({
    required this.homePageBannerRepo,
  });

  @override
  Future<DataState<List<HomePageBannerResEntity>>> call(params) {
    return homePageBannerRepo.getHomePageBanners(params);
  }
}
