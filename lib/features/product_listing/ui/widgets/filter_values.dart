import 'package:anah_luxury/features/product_listing/ui/widgets/list_filter.dart';
import 'package:anah_luxury/features/product_listing/ui/widgets/range_filter.dart';
import 'package:flutter/material.dart';
import '../../data/models/product_list_model.dart';

class FilterValues extends StatelessWidget {
  const FilterValues(
      {super.key,
      required this.filterType,
      this.start,
      this.end,
      this.rangeValue,
      this.filterList});
  final FilterType filterType;
  final int? start;
  final int? end;
  final String? rangeValue;
  final List<Brands>? filterList;

  @override
  Widget build(BuildContext context) {
    return filterType == FilterType.list
        ? ListFilter(filters: filterList!)
        : RangeFilter(startValue: start!, endValue: end!);
  }
}

enum FilterType { range, list }
