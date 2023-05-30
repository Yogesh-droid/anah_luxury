import '../../../../core/resource/data_state/data_state.dart';
import '../../../../core/resource/request_params/request_params.dart';
import '../entities/buying_list_entity.dart';

abstract class BuyingListRepo {
  Future<DataState<List<BuyingListEntity>>> getUserBuyingListList(
      {RequestParams requestParams});
}
