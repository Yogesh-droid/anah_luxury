import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/car_detail_model.dart';
part 'product_image_switcher_state.dart';

class ProductImageSwitcherCubit extends Cubit<ProductImageSwitcherState> {
  ProductImageSwitcherCubit() : super(ProductImageSwitcherInitial());
  void switchImages(List<All> list) {
    emit(ProductImagesSwitched(productImages: list));
  }
}
