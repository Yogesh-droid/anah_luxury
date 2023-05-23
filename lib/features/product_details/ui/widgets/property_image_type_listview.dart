import 'package:anah_luxury/features/product_details/domain/entities/property_detail_entity.dart';
import 'package:anah_luxury/features/product_details/ui/controllers/product_image_switcher/product_image_switcher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/constants/strings.dart';
import 'product_image_category.dart';

class PropertyImageTypeListView extends StatefulWidget {
  const PropertyImageTypeListView(
      {super.key, required this.propertyDetailEntity});
  final PropertyDetailEntity propertyDetailEntity;

  @override
  State<PropertyImageTypeListView> createState() =>
      _PropertyImageTypeListViewState();
}

class _PropertyImageTypeListViewState extends State<PropertyImageTypeListView> {
  @override
  void initState() {
    context
        .read<ProductImageSwitcherCubit>()
        .switchImages(widget.propertyDetailEntity.bedroom!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        alignment: Alignment.centerLeft,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: appPadding),
          children: [
            widget.propertyDetailEntity.hall!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.propertyDetailEntity.hall ?? [],
                    title: kHall,
                    onTap: () {
                      context
                          .read<ProductImageSwitcherCubit>()
                          .switchImages(widget.propertyDetailEntity.hall!);
                    },
                  )
                : const SizedBox(),
            widget.propertyDetailEntity.bedroom!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.propertyDetailEntity.bedroom ?? [],
                    title: kBedroom,
                    onTap: () {
                      context
                          .read<ProductImageSwitcherCubit>()
                          .switchImages(widget.propertyDetailEntity.bedroom!);
                    })
                : const SizedBox(),
            widget.propertyDetailEntity.diningRoom!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.propertyDetailEntity.diningRoom ?? [],
                    title: kDiningRoom,
                    onTap: () {
                      context.read<ProductImageSwitcherCubit>().switchImages(
                          widget.propertyDetailEntity.diningRoom!);
                    })
                : const SizedBox(),
            widget.propertyDetailEntity.garden!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.propertyDetailEntity.garden ?? [],
                    title: kGarden,
                    onTap: () {
                      context
                          .read<ProductImageSwitcherCubit>()
                          .switchImages(widget.propertyDetailEntity.garden!);
                    })
                : const SizedBox(),
            widget.propertyDetailEntity.kitchen!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.propertyDetailEntity.kitchen ?? [],
                    title: kKitchen,
                    onTap: () {
                      context
                          .read<ProductImageSwitcherCubit>()
                          .switchImages(widget.propertyDetailEntity.kitchen!);
                    })
                : const SizedBox(),
            widget.propertyDetailEntity.livingRoom!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.propertyDetailEntity.livingRoom ?? [],
                    title: kLivingRoom,
                    onTap: () {
                      context.read<ProductImageSwitcherCubit>().switchImages(
                          widget.propertyDetailEntity.livingRoom!);
                    })
                : const SizedBox(),
          ],
        ));
  }
}
