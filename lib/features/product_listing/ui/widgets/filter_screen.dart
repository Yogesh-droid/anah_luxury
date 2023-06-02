import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/landing/ui/widgets/anah_auth_button.dart';
import 'package:anah_luxury/features/product_listing/data/models/product_list_model.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/cubit/range_slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubit/filter_cubit.dart';
import '../controllers/product_list/product_list_bloc.dart';
import 'filter_title.dart';
import 'filter_values.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key, required this.onApplyTap});
  final Function() onApplyTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        if (state is ProductListFinal) {
          var filters = state.filtersList;
          return Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: BlocBuilder<FilterCubit, String>(
                          builder: (context, state) {
                            return ListView(children: [
                              filters.price != null
                                  ? FilterTitle(
                                      title: kPrice,
                                      isSelected: state == kPrice,
                                      end: filters.price!.end ?? 0,
                                      start: filters.price!.start ?? 0,
                                    )
                                  : const SizedBox(),
                              filters.brands != null &&
                                      filters.brands!.isNotEmpty
                                  ? FilterTitle(
                                      title: kBrands,
                                      isSelected: state == kBrands,
                                      filterList: filters.brands,
                                    )
                                  : const SizedBox(),
                              filters.cmakers != null &&
                                      filters.cmakers!.isNotEmpty
                                  ? FilterTitle(
                                      title: kSellers,
                                      isSelected: state == kSellers,
                                      filterList: filters.cmakers,
                                    )
                                  : const SizedBox(),
                              filters.categories != null &&
                                      filters.categories!.isNotEmpty
                                  ? FilterTitle(
                                      title: kCategories,
                                      isSelected: state == kCategories,
                                      filterList: filters.categories,
                                    )
                                  : const SizedBox(),
                              filters.kmDriven != null &&
                                      filters.kmDriven!.start != null
                                  ? FilterTitle(
                                      title: kKmDriven,
                                      isSelected: state == kKmDriven,
                                      start: filters.kmDriven!.start ?? 0,
                                      end: filters.kmDriven!.end ?? 0)
                                  : const SizedBox(),
                              filters.year != null &&
                                      filters.year!.start != null
                                  ? FilterTitle(
                                      title: kYears,
                                      isSelected: state == kYears,
                                      start: filters.year!.start ?? 0,
                                      end: filters.year!.end ?? 0)
                                  : const SizedBox(),
                              filters.rooms != null &&
                                      filters.rooms!.start != null
                                  ? FilterTitle(
                                      title: kLivingSpace,
                                      isSelected: state == kLivingSpace,
                                      start: filters.rooms!.start ?? 0,
                                      end: filters.rooms!.end ?? 0,
                                    )
                                  : const SizedBox(),
                              filters.buildArea != null &&
                                      filters.buildArea!.start != null
                                  ? FilterTitle(
                                      title: kPropertyArea,
                                      isSelected: state == kPropertyArea,
                                      start: filters.buildArea!.start ?? 0,
                                      end: filters.buildArea!.end,
                                    )
                                  : const SizedBox(),
                              filters.propertyType != null &&
                                      filters.propertyType!.fullyFurnished !=
                                          null
                                  ? FilterTitle(
                                      title: kCondition,
                                      isSelected: state == kCondition,
                                      filterList: [
                                        Brands(
                                            name: filters
                                                .propertyType!.fullyFurnished),
                                        Brands(
                                            name: filters
                                                .propertyType!.semiFurnished),
                                        Brands(
                                            name: filters
                                                .propertyType!.unFurnished)
                                      ],
                                    )
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
                                filterKey: 'price',
                                filterType: FilterType.range,
                                start: filters.price!.start ?? 0,
                                end: filters.price!.end ?? 0,
                                rangeValue:
                                    "AED ${filters.price!.start ?? 0} - AED${filters.price!.end ?? 0}",
                              );
                            case kBrands:
                              return FilterValues(
                                filterKey: 'brand',
                                filterType: FilterType.list,
                                filterList: filters.brands,
                              );

                            case kCategories:
                              return FilterValues(
                                filterKey: 'category',
                                filterType: FilterType.list,
                                filterList: filters.categories,
                              );

                            case kKmDriven:
                              return FilterValues(
                                filterKey: 'kmDriven',
                                filterType: FilterType.range,
                                start: filters.kmDriven!.start ?? 0,
                                end: filters.kmDriven!.end,
                                rangeValue:
                                    "${filters.kmDriven!.start} KM - ${filters.kmDriven!.end} KM",
                              );
                            case kYears:
                              return FilterValues(
                                filterKey: 'year',
                                filterType: FilterType.range,
                                start: filters.year!.start ?? 0,
                                end: filters.year!.end,
                                rangeValue:
                                    "${filters.year!.start} - ${filters.year!.end}",
                              );
                            case kSellers:
                              return FilterValues(
                                  filterKey: 'seller',
                                  filterType: FilterType.list,
                                  filterList: filters.sellers);
                            case kLivingSpace:
                              return FilterValues(
                                filterKey: 'rooms',
                                filterType: FilterType.range,
                                start: filters.rooms!.start,
                                end: filters.rooms!.end,
                              );
                            case kPropertyArea:
                              return FilterValues(
                                filterKey: 'buildArea',
                                filterType: FilterType.range,
                                start: filters.buildArea!.start,
                                end: filters.buildArea!.end,
                              );
                            case kCondition:
                              return FilterValues(
                                  filterType: FilterType.list,
                                  filterKey: 'propertyType',
                                  filterList: [
                                    Brands(
                                        name: filters
                                            .propertyType!.fullyFurnished),
                                    Brands(
                                        name: filters
                                            .propertyType!.semiFurnished),
                                    Brands(
                                        name: filters.propertyType!.unFurnished)
                                  ]);
                            default:
                              return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: AnahAuthButton(
                      borderColor: black,
                      title: kClear,
                      isFilled: false,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )),
                    const SizedBox(width: 15),
                    Expanded(
                        child: AnahAuthButton(
                      borderColor: black,
                      fillColor: black,
                      title: kApply,
                      onTap: () {
                        final productListBloc = context.read<ProductListBloc>();

                        final slideRangeCubit =
                            context.read<RangeSliderCubit>();

                        productListBloc.selectedFilterList
                            .addAll(slideRangeCubit.filterMap);
                        List<String> filters = [];
                        productListBloc.selectedFilterList
                            .forEach((key, value) {
                          filters.add("&$key=$value");
                        });
                        productListBloc.filterQuery =
                            filters.join().trim().replaceAll(' ', '');

                        onApplyTap();
                      },
                    )),
                  ],
                ),
              )
            ],
          );
        }
        return const Center(child: Text("No Filter Available"));
      },
    );
  }
}
