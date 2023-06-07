import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';

import '../repo/add_to_wishlist_repo.dart';

class AddToWishlistUsecase extends Usecase {
  final AddToWishlistRepo addToWishlistRepo;

  AddToWishlistUsecase({required this.addToWishlistRepo});
  @override
  Future<DataState<String>> call(params) async {
    return await addToWishlistRepo.addTowishList(params);
  }
}
