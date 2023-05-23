import 'package:anah_luxury/features/product_details/domain/entities/car_detail_entity.dart';
import 'package:anah_luxury/features/product_details/ui/controllers/product_image_switcher/product_image_switcher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/constants/strings.dart';
import 'product_image_category.dart';

class CarImageTypeListView extends StatefulWidget {
  const CarImageTypeListView({super.key, required this.carDetailEntity});
  final CarDetailEntity carDetailEntity;

  @override
  State<CarImageTypeListView> createState() => _CarImageTypeListViewState();
}

class _CarImageTypeListViewState extends State<CarImageTypeListView> {
  @override
  void initState() {
    context
        .read<ProductImageSwitcherCubit>()
        .switchImages(widget.carDetailEntity.all!);
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
            widget.carDetailEntity.all!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.carDetailEntity.all ?? [],
                    title: kAll,
                    onTap: () {
                      context
                          .read<ProductImageSwitcherCubit>()
                          .switchImages(widget.carDetailEntity.all!);
                    },
                  )
                : const SizedBox(),
            widget.carDetailEntity.exterior!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.carDetailEntity.exterior ?? [],
                    title: kExterior,
                    onTap: () {})
                : const SizedBox(),
            widget.carDetailEntity.interior!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.carDetailEntity.interior ?? [],
                    title: kInterior,
                    onTap: () {})
                : const SizedBox(),
            widget.carDetailEntity.engine!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.carDetailEntity.engine ?? [],
                    title: kEngine,
                    onTap: () {})
                : const SizedBox(),
            widget.carDetailEntity.wheel!.isNotEmpty
                ? ProductImagecategory(
                    all: widget.carDetailEntity.wheel ?? [],
                    title: kWheel,
                    onTap: () {})
                : const SizedBox(),
          ],
        ));
  }
}
