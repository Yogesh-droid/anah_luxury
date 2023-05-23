import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/cubit/range_slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/text_tyles.dart';
import '../../data/models/product_list_model.dart';

class RangeFilter extends StatefulWidget {
  const RangeFilter(
      {super.key,
      required this.startValue,
      required this.endValue,
      this.start,
      this.end,
      this.rangeValue,
      this.filterList});
  final int startValue;
  final int endValue;
  final int? start;
  final int? end;
  final String? rangeValue;
  final List<Brands>? filterList;

  @override
  State<RangeFilter> createState() => _RangeFilterState();
}

class _RangeFilterState extends State<RangeFilter> {
  @override
  void initState() {
    context.read<RangeSliderCubit>().onChangeValue(
        RangeValues(widget.startValue.toDouble(), widget.endValue.toDouble()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RangeSliderCubit, RangeValues>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: appPadding),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${state.start.toInt()} - ${state.end.toInt()}",
                style: secMed15.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            RangeSlider(
              onChanged: (RangeValues value) {
                context.read<RangeSliderCubit>().onChangeValue(value);
              },
              min: widget.startValue.toDouble(),
              max: widget.endValue.toDouble(),
              values: state,
            ),
          ],
        );
      },
    );
  }
}
