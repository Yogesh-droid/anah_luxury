import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/domain/entities/home_page_banner_res_entity.dart';
import 'package:anah_luxury/features/home/domain/usecase/home_page_banner_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
        DataState<List<HomePageBannerResEntity>> _bannerList =
            await homePageBannerUsecase.call(const RequestParams(
                url: "${baseUrl}app/homepage", apiMethods: ApiMethods.get));

        if (_bannerList.data != null) {
          for (var banner in _bannerList.data!) {
            bannerList.add(banner);
          }
        }
      }
      emit(HomePageBannerResultState(bannerList: bannerList));
    });
  }
}
