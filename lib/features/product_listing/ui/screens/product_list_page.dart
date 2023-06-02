import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/dashboard/ui/widgets/anah_app_bar.dart';
import 'package:anah_luxury/features/home/ui/widgets/product_container.dart';
import 'package:anah_luxury/features/product_listing/ui/controllers/cubit/range_slider_cubit.dart';
import 'package:anah_luxury/features/product_listing/ui/widgets/filter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/routes.dart';
import '../controllers/product_list/product_list_bloc.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage(
      {super.key,
      required this.query,
      required this.name,
      required this.category});
  final String query;
  final String name;
  final String category;

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    context.read<ProductListBloc>().filterQuery = '';
    context.read<ProductListBloc>().selectedFilterList.clear();
    context.read<RangeSliderCubit>().filterMap.clear();
    context
        .read<ProductListBloc>()
        .add(GetProductListEvent(query: widget.query));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnahSecondaryAppBar(
        title: widget.name,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            if (state is ProductListInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductListFinal) {
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9, crossAxisCount: 2),
                  itemCount: state.productList.length,
                  itemBuilder: (context, index) {
                    var product = state.productList[index];
                    return ProductContainer(
                      productName: product.title ?? '',
                      onProductTapped: (category, slug) {
                        if (category == kCars) {
                          context.pushNamed(carDetailPageName,
                              queryParams: {"slug": slug});
                        } else {
                          context.pushNamed(propertyDetailPageName,
                              queryParams: {"slug": slug});
                        }
                      },
                      onWishListTapped: (id) {},
                      backgroundImage: product.uploadedFiles![0].fileUrl,
                      netPrice: product.price.toString(),
                      currency: product.prodCurrency!.currencyName ?? '',
                      height: MediaQuery.of(context).size.height * 0.182,
                      width: MediaQuery.of(context).size.width / 2,
                      category: widget.category,
                      slug: product.slug,
                    );
                  });
            } else if (state is ProductListError) {
              return Center(
                child: Text(state.exception.toString()),
              );
            }
            return const Center(child: Text("Something went wrong"));
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: white, boxShadow: [
          BoxShadow(color: grey5, offset: Offset(0, -5), blurRadius: 10)
        ]),
        height: 56,
        child: Row(children: [
          Expanded(
            child: TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Container();
                      });
                },
                label: const Text(kSortBy, style: secMed18),
                icon: const Icon(
                  CupertinoIcons.arrow_up_arrow_down,
                  color: black,
                  size: 18,
                )),
          ),
          Expanded(
            child: TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      enableDrag: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (_) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: FilterScreen(onApplyTap: () {
                              context.read<ProductListBloc>().add(
                                  GetProductListEvent(query: widget.query));
                              Navigator.pop(context);
                            }));
                      });
                },
                label: const Text(
                  kFilterBy,
                  style: secMed18,
                ),
                icon: const Icon(
                  CupertinoIcons.line_horizontal_3_decrease,
                  color: black,
                  size: 18,
                )),
          )
        ]),
      ),
    );
  }
}
