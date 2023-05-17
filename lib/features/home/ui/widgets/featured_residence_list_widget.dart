import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/features/home/ui/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/featured_luxury_residence/featured_lusxury_residence_bloc_bloc.dart';

class FeaturedResidenceListWidget extends StatelessWidget {
  const FeaturedResidenceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedLusxuryResidenceBlocBloc,
        FeaturedLusxuryResidenceBlocState>(builder: (context, state) {
      if (state is FeaturedLusxuryResidenceBlocInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FeaturedLuxuryResidenceResState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.295,
          child: ListView(
            padding: const EdgeInsets.only(
                left: appListViewHorizontalPadding,
                right: appListViewHorizontalPadding),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: state.featuredApartments
                .map((e) => ProductContainer(
                      productName: e.title ?? '',
                      onProductTapped: (slug) {},
                      backgroundImage: e.uploadedFiles![0].fileUrl,
                      currency: e.currency![0].currencyName,
                      netPrice: e.salePrice.toString(),
                      height: MediaQuery.of(context).size.height * 0.185,
                      width: MediaQuery.of(context).size.width / 2,
                      slug: e.slug,
                    ))
                .toList(),
          ),
        );
      }
      return const Center(child: Text("Some Err"));
    });
  }
}
