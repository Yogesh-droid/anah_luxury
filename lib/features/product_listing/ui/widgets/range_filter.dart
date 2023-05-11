import 'package:anah_luxury/features/product_listing/ui/controllers/cubit/range_slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RangeFilter extends StatefulWidget {
  const RangeFilter(
      {super.key, required this.startValue, required this.endValue});
  final int startValue;
  final int endValue;

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
        return RangeSlider(
          onChanged: (RangeValues value) {
            context.read<RangeSliderCubit>().onChangeValue(value);
          },
          min: widget.startValue.toDouble(),
          max: widget.endValue.toDouble(),
          values: state,
        );
      },
    );
  }
}
