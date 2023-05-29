import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/product_details/domain/entities/property_detail_entity.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/product_carousel.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/product_overview_widget.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/property_image_type_listview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/routes/routes.dart';
import 'book_now_widget.dart';

class PropertyDetailWidget extends StatelessWidget {
  const PropertyDetailWidget({super.key, required this.propertyDetailEntity});
  final PropertyDetailEntity propertyDetailEntity;

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
                propertyDetailEntity.title ?? '',
                style: secMed15.copyWith(
                    fontFamily: "PlayfairDisplay", fontWeight: FontWeight.w700),
              )),
              Column(
                children: [
                  Text(
                    propertyDetailEntity.price ?? '',
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
        PropertyImageTypeListView(propertyDetailEntity: propertyDetailEntity),
        appDivider(),
        BookNowWidget(
            bookingPrice: propertyDetailEntity.bookingPrice ?? 'Not Available',
            onTap: () {
              context.pushNamed(bookNowPageName, queryParams: {
                "category": kProperties,
                "categoryId": propertyDetailEntity.categoryId,
                "productId": propertyDetailEntity.id
              });
            }),
        appDivider(),
        const SizedBox(height: appWidgetGap),
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
        ProductOverviewWidget(
            overviews: propertyDetailEntity.propertyOverView!),
        const SizedBox(height: appPadding),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: appPadding),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              kOtherFeatures,
              style: secMed14,
            ),
          ),
        ),
        //ProductOverviewWidget(overviews: carDetailEntity.carSpecification!)
      ]),
    );
  }
}
