import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/saved/domain/entities/buying_list_entity.dart';
import 'package:anah_luxury/features/saved/domain/repo/buying_list_repo.dart';

class ByuingListUsecase extends Usecase {
  final BuyingListRepo buyingListRepo;

  ByuingListUsecase({required this.buyingListRepo});
  @override
  Future<DataState<List<BuyingListEntity>>> call(params) async {
    return await buyingListRepo.getUserBuyingListList(requestParams: params);
  }
}
