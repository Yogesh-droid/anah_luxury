import '../../../../core/resource/data_state/data_state.dart';
import '../../../../core/resource/request_params/request_params.dart';
import '../entities/wishlist_entity.dart';

abstract class UserWishListRepo {
  Future<DataState<List<WishListEntity>>> getUseWishList(
      {RequestParams requestParams});
}
