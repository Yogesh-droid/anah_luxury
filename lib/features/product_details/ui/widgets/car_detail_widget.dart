import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/product_details/domain/entities/car_detail_entity.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/book_now_widget.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/product_carousel.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/car_image_type_listview.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/product_overview_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/routes/routes.dart';

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
              Column(
                children: [
                  Text(
                    carDetailEntity.price ?? '',
                    style: secMed15.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    kOnRoadPrice,
                    style: secMed10.copyWith(color: grey2),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: appWidgetGap),
        const ProductCarousel(),
        const SizedBox(height: appPadding),
        CarImageTypeListView(carDetailEntity: carDetailEntity),
        appDivider(),
        BookNowWidget(
            bookingPrice: carDetailEntity.bookingPrice ?? 'Not Available',
            onTap: () {
              context.pushNamed(bookNowPageName, queryParams: {
                "category": kCars,
                "categoryId": carDetailEntity.categoryId,
                "productId": carDetailEntity.id
              });
            }),
        appDivider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: appPadding),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              kCarOverview,
              style: secMed14,
            ),
          ),
        ),
        ProductOverviewWidget(overviews: carDetailEntity.carOverView!),
        const SizedBox(height: appPadding),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: appPadding),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              kCarSpecification,
              style: secMed14,
            ),
          ),
        ),
        ProductOverviewWidget(overviews: carDetailEntity.carSpecification!)
      ]),
    );
  }
}
