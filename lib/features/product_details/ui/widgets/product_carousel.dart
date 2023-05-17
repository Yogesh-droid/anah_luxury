import 'package:anah_luxury/features/home/ui/screens/home_carousel.dart';
import 'package:anah_luxury/features/product_details/ui/controllers/product_image_switcher/product_image_switcher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductImageSwitcherCubit, ProductImageSwitcherState>(
      builder: (context, state) {
        if (state is ProductImagesSwitched) {
          List<String> list = [];
          for (var element in state.productImages) {
            list.add(element.fileUrl ?? '');
          }
          return HomeCarousel(
            bannerList: list,
            height: 250,
          );
        }
        return const SizedBox();
      },
    );
  }
}
