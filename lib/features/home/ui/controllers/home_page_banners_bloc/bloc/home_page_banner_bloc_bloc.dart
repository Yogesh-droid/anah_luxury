import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/domain/entities/home_page_banner_res_entity.dart';
import 'package:anah_luxury/features/home/domain/usecase/home_page_banner_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_banner_bloc_event.dart';
part 'home_page_banner_bloc_state.dart';

class HomePageBannerBlocBloc
    extends Bloc<HomePageBannerBlocEvent, HomePageBannerBlocState> {
  final HomePageBannerUsecase homePageBannerUsecase;
  final List<HomePageBannerResEntity> bannerList = [];

  HomePageBannerBlocBloc({required this.homePageBannerUsecase})
      : super(HomePageBannerBlocInitial()) {
    on<HomePageBannerBlocEvent>((event, emit) async {
      if (event is GetHomePageBannersEvent) {
        DataState<List<HomePageBannerResEntity>> bannerList1 =
            await homePageBannerUsecase.call(RequestParams(
                url: "${baseUrl}app/homepage", apiMethods: ApiMethods.get));

        if (bannerList1.data != null) {
          for (var banner in bannerList1.data!) {
            bannerList.add(banner);
          }
        }
      }
      emit(HomePageBannerResultState(bannerList: bannerList));
    });
  }
}
