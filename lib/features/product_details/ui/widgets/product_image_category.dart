import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/features/cars/ui/widgets/category_widget.dart';
import 'package:anah_luxury/features/product_details/data/models/car_detail_model.dart';
import 'package:flutter/material.dart';

class ProductImagecategory extends StatelessWidget {
  const ProductImagecategory(
      {super.key, required this.all, this.title, required this.onTap});
  final List<All> all;
  final String? title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: appPadding),
        child: Container(
          width: 150,
          decoration: BoxDecoration(border: Border.all(color: black, width: 5)),
          child: CategoryWidget(
            image: all[0].fileUrl,
            title: title!.toUpperCase(),
          ),
        ),
      ),
    );
  }
}
