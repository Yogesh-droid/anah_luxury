import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/product_list_model.dart';
import '../controllers/cubit/range_slider_cubit.dart';

class FilterTitle extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int? start;
  final int? end;
  final String? rangeValue;
  final List<Brands>? filterList;
  const FilterTitle(
      {super.key,
      required this.title,
      required this.isSelected,
      this.start,
      this.end,
      this.rangeValue,
      this.filterList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<FilterCubit>().addFilter(title);
        if (start != null && end != null) {
          context
              .read<RangeSliderCubit>()
              .onChangeValue(RangeValues(start!.toDouble(), end!.toDouble()));
        }
      },
      child: Container(
        height: 60,
        color: isSelected ? white : grey7,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style:
                secMed15.copyWith(fontFamily: 'PlayfairDisplay', color: black),
          ),
        ),
      ),
    );
  }
}
