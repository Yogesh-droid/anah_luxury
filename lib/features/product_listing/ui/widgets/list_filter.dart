import 'package:anah_luxury/features/product_listing/ui/controllers/product_list/product_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product_list_model.dart';

class ListFilter extends StatelessWidget {
  ListFilter({super.key, required this.filters, required this.filterKey});
  late ProductListBloc productListBloc;
  final List<Brands> filters;
  final String filterKey;
  @override
  Widget build(BuildContext context) {
    productListBloc = context.read<ProductListBloc>();
    return ListView(
      shrinkWrap: true,
      children: filters.map((e) {
        return TextButton(
            onPressed: () {
              context.read<ProductListBloc>().selectedFilterList[filterKey] =
                  e.slug ?? e.name ?? '';
            },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e.name ?? ''),
                )));
      }).toList(),
    );
  }
}
