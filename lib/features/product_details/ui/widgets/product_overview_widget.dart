import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/product_details/data/models/car_detail_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/spaces.dart';

class ProductOverviewWidget extends StatelessWidget {
  const ProductOverviewWidget({super.key, required this.overviews});
  final List<OverviewType> overviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 3),
          shrinkWrap: true,
          itemCount: overviews.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return OverviewContainer(
              title: overviews[index].title,
              value: overviews[index].value.toString(),
            );
          },
        ),
      ]),
    );
  }
}

class OverviewContainer extends StatelessWidget {
  const OverviewContainer({super.key, this.title, this.value});

  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: grey5)),
      child: Padding(
        padding: const EdgeInsets.only(left: appPadding),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!,
                style: secMed10.copyWith(color: grey2),
              ),
              const SizedBox(height: 5),
              Text(
                value!,
                style: secMed12.copyWith(fontWeight: FontWeight.w700),
              )
            ]),
      ),
    );
  }
}
