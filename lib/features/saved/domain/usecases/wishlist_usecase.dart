import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/saved/domain/entities/wishlist_entity.dart';
import 'package:anah_luxury/features/saved/domain/repo/user_wishlist_repo.dart';

class WishListUsecase extends Usecase {
  final UserWishListRepo userWishListRepo;

  WishListUsecase(this.userWishListRepo);
  @override
  Future<DataState<List<WishListEntity>>> call(params) async {
    return await userWishListRepo.getUseWishList(requestParams: params);
  }
}
