import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/features/cars/domain/entity/brands_entity.dart';
import 'package:anah_luxury/features/cars/ui/widgets/brands_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/brands_bloc/brands_bloc.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsBloc, BrandsState>(
      builder: (context, state) {
        if (state is BrandsInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BrandsSuccessState) {
          List<BrandsEntity> brandsList = state.brandsList;
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView(
              padding: const EdgeInsets.only(left: appPadding),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: brandsList
                  .map((e) => BrandsCard(
                        image: e.imgLogoPath ?? '',
                        id: e.sId,
                        onTap: () {},
                        slug: e.slug,
                      ))
                  .toList(),
            ),
          );
        } else if (state is BrandsErrorState) {
          return Text(state.exception.toString());
        }
        return const Text("Unknown Error");
      },
    );
  }
}
