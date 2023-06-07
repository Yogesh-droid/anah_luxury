import 'package:anah_luxury/core/resource/request_params/request_params.dart';

import '../../../../core/resource/data_state/data_state.dart';

abstract class AddToWishlistRepo {
  Future<DataState<String>> addTowishList(RequestParams requestParams);
}
