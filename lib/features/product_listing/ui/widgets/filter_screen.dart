import 'package:anah_luxury/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubit/filter_cubit.dart';
import '../controllers/product_list/product_list_bloc.dart';
import 'filter_title.dart';
import 'filter_values.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        if (state is ProductListFinal) {
          var filters = state.filtersList;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: BlocBuilder<FilterCubit, String>(
                    builder: (context, state) {
                      return ListView(children: [
                        filters.price != null
                            ? FilterTitle(
                                title: kPrice, isSelected: state == kPrice)
                            : const SizedBox(),
                        filters.brands != null && filters.brands!.isNotEmpty
                            ? FilterTitle(
                                title: kBrands, isSelected: state == kBrands)
                            : const SizedBox(),
                        filters.cmakers != null && filters.cmakers!.isNotEmpty
                            ? FilterTitle(
                                title: kSellers, isSelected: state == kSellers)
                            : const SizedBox(),
                        filters.categories != null &&
                                filters.categories!.isNotEmpty
                            ? FilterTitle(
                                title: kCategories,
                                isSelected: state == kCategories)
                            : const SizedBox(),
                        filters.kmDriven != null &&
                                filters.kmDriven!.start != null
                            ? FilterTitle(
                                title: kKmDriven,
                                isSelected: state == kKmDriven)
                            : const SizedBox(),
                        filters.year != null && filters.year!.start != null
                            ? FilterTitle(
                                title: kYears, isSelected: state == kYears)
                            : const SizedBox(),
                        filters.rooms != null && filters.rooms!.start != null
                            ? FilterTitle(
                                title: kLivingSpace,
                                isSelected: state == kLivingSpace)
                            : const SizedBox(),
                        filters.buildArea != null &&
                                filters.buildArea!.start != null
                            ? FilterTitle(
                                title: kPropertyArea,
                                isSelected: state == kPropertyArea)
                            : const SizedBox(),
                        filters.propertyType != null &&
                                filters.propertyType!.fullyFurnished != null
                            ? FilterTitle(
                                title: kCondition,
                                isSelected: state == kCondition)
                            : const SizedBox(),
                      ]);
                    },
                  )),
              Expanded(
                flex: 3,
                child: BlocBuilder<FilterCubit, String>(
                  builder: (context, state) {
                    switch (state) {
                      case kPrice:
                        return FilterValues(
                          filterType: FilterType.range,
                          start: filters.price!.start ?? 0,
                          end: filters.price!.end ?? 0,
                          rangeValue:
                              "AED ${filters.price!.start ?? 0} - AED${filters.price!.end ?? 0}",
                        );
                      case kBrands:
                        return FilterValues(
                          filterType: FilterType.list,
                          filterList: filters.brands,
                        );

                      case kCategories:
                        return FilterValues(
                          filterType: FilterType.list,
                          filterList: filters.categories,
                        );

                      case kKmDriven:
                        return FilterValues(
                          filterType: FilterType.range,
                          start: filters.kmDriven!.start ?? 0,
                          end: filters.kmDriven!.end,
                          rangeValue:
                              "${filters.kmDriven!.start} KM - ${filters.kmDriven!.end} KM",
                        );
                      case kYears:
                        return FilterValues(
                          filterType: FilterType.range,
                          start: filters.year!.start ?? 0,
                          end: filters.year!.end,
                          rangeValue:
                              "${filters.year!.start} - ${filters.year!.end}",
                        );

                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          );
        }
        return const Center(child: Text("No Filter Available"));
      },
    );
  }
}
