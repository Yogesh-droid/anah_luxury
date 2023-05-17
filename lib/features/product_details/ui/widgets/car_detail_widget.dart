import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/product_details/domain/entities/car_detail_entity.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/product_carousel.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/product_image_type_listview.dart';
import 'package:flutter/material.dart';

class CarDetailWidget extends StatelessWidget {
  const CarDetailWidget({super.key, required this.carDetailEntity});
  final CarDetailEntity carDetailEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: appPadding),
        Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                carDetailEntity.title ?? '',
                style: secMed15.copyWith(
                    fontFamily: "PlayfairDisplay", fontWeight: FontWeight.w700),
              )),
              Text(
                carDetailEntity.price ?? '',
                style: secMed15.copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        const SizedBox(height: appWidgetGap),
        const ProductCarousel(),
        const SizedBox(height: appPadding),
        ProductImageTypeListView(carDetailEntity: carDetailEntity)
      ]),
    );
  }
}
