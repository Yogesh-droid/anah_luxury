import 'package:flutter/material.dart';
import '../../data/models/product_list_model.dart';

class ListFilter extends StatelessWidget {
  const ListFilter({super.key, required this.filters});

  final List<Brands> filters;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: filters
          .map((e) => TextButton(
              onPressed: () {},
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.name ?? ''),
                  ))))
          .toList(),
    );
  }
}
