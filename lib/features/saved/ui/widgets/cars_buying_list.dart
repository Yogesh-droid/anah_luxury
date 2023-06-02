import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/saved/ui/controllers/buyinglist/buying_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/ui/widgets/app_title_list_widget.dart';
import '../../../home/ui/widgets/product_container.dart';

class CarsBuyingList extends StatelessWidget {
  const CarsBuyingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyingListBloc, BuyingListState>(
      builder: (context, state) {
        if (state is BuyingListInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (context.read<BuyingListBloc>().carBuyingList.isNotEmpty) {
          return AppTitleAndListWidget(
            title: kBuyingList,
            onViewAllTapped: () {},
            categoryBody: SizedBox(
              height: 300,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: context
                      .read<BuyingListBloc>()
                      .carBuyingList
                      .map((e) => ProductContainer(
                            height: 200,
                            productName: e.title ?? '',
                            onProductTapped: (category, slug) {},
                            backgroundImage: e.uploadedFiles!,
                            specifications: [
                              "${e.kmDriven} k Miles         ",
                            ],
                          ))
                      .toList()),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
