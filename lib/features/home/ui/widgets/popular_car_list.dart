import 'package:anah_luxury/features/home/ui/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/routes/routes.dart';
import '../controllers/featured_luxury_cars/featured_luxury_cars_bloc_bloc.dart';

class PopularCarsList extends StatelessWidget {
  const PopularCarsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedLuxuryCarsBlocBloc, FeaturedLuxuryCarsBlocState>(
        builder: (context, state) {
      if (state is FeaturedLuxuryCarsBlocInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FeaturedLuxuryCarsREsState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.295,
          child: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: appListViewHorizontalPadding),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: state.luxuryCarsList
                .map((e) => ProductContainer(
                    productName: e.title ?? '',
                    onProductTapped: (category, slug) {
                      context.pushNamed(carDetailPageName,
                          queryParams: {"slug": slug});
                    },
                    backgroundImage: e.uploadedFiles![0].fileUrl,
                    currency: e.currency![0].currencyName,
                    netPrice: e.salePrice.toString(),
                    height: MediaQuery.of(context).size.height * 0.180,
                    width: MediaQuery.of(context).size.width / 2.1,
                    slug: e.slug))
                .toList(),
          ),
        );
      } else if (state is FeaturedluxuryCarsErrorState) {
        return Center(child: Text("Some Err ${state.err.toString()}"));
      }
      return const Center(child: Text("Some Err "));
    });
  }
}
