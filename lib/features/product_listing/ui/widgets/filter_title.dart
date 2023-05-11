import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';

class FilterTitle extends StatelessWidget {
  final String title;
  final bool isSelected;
  const FilterTitle({super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<FilterCubit>().addFilter(title);
      },
      child: Container(
        height: 60,
        color: isSelected ? white : grey7,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: sec_med_15.copyWith(
                fontFamily: 'PlayfairDisplay', color: black),
          ),
        ),
      ),
    );
  }
}
