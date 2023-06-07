import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/saved/ui/controllers/buyinglist/buying_list_bloc.dart';
import 'package:anah_luxury/features/saved/ui/controllers/test_drive_tours/test_drive_tour_list_bloc.dart';
import 'package:anah_luxury/features/saved/ui/controllers/wishlist/wish_list_controller_bloc.dart';
import 'package:anah_luxury/features/saved/ui/screens/saved_cars_tab.dart';
import 'package:anah_luxury/features/saved/ui/screens/saved_properties_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets.dart';
import '../../../menu/ui/controllers/profile_bloc/profile_bloc.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late TestDriveTourListBloc testDriveBloc;
  late WishListControllerBloc wishListControllerBloc;
  late BuyingListBloc buyingListBloc;
  late String useId;
  @override
  void initState() {
    testDriveBloc = context.read<TestDriveTourListBloc>();
    wishListControllerBloc = context.read<WishListControllerBloc>();
    buyingListBloc = context.read<BuyingListBloc>();

    tabController = TabController(
        length: 2, vsync: this, animationDuration: const Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFetchedState) {
            useId = context.read<ProfileBloc>().profileEntity.sId ?? '';

            testDriveBloc.add(GetTestDriveAndToursList(categorySlug: 'cars'));
            buyingListBloc.add(GetBuyingListEvent(slug: 'cars', userId: useId));
            wishListControllerBloc
                .add(GetWishListEvent(slug: 'cars', userId: useId));
          }
        },
        builder: (context, state) {
          if (state is ProfileFetchedState) {
            return Column(
              children: [
                TabBar(
                  isScrollable: false,
                  labelStyle: secMed14,
                  labelColor: black,
                  controller: tabController,
                  indicatorColor: black,
                  indicatorWeight: 3,
                  // indicator: CustomIndicator(),
                  tabs: [
                    Tab(text: kCars.toUpperCase()),
                    Tab(text: kProperties.toUpperCase())
                  ],
                  physics: const NeverScrollableScrollPhysics(),
                  onTap: (value) {
                    if (value == 0) {
                      if (testDriveBloc.testDriveList.isEmpty) {
                        testDriveBloc.add(
                            GetTestDriveAndToursList(categorySlug: 'cars'));
                      }
                      if (buyingListBloc.carBuyingList.isEmpty) {
                        buyingListBloc.add(
                            GetBuyingListEvent(slug: 'cars', userId: useId));
                      }
                      if (wishListControllerBloc.carsWishList.isEmpty) {
                        wishListControllerBloc
                            .add(GetWishListEvent(slug: 'cars', userId: useId));
                      }
                    } else {
                      if (testDriveBloc.toursList.isEmpty) {
                        testDriveBloc.add(GetTestDriveAndToursList(
                            categorySlug: 'real-estate'));
                      }
                      if (buyingListBloc.propertyBuyingList.isEmpty) {
                        buyingListBloc.add(GetBuyingListEvent(
                            slug: 'real-estate', userId: useId));
                      }
                      if (wishListControllerBloc.toursWishList.isEmpty) {
                        wishListControllerBloc.add(GetWishListEvent(
                            slug: 'real-estate', userId: useId));
                      }
                    }
                  },
                ),
                Expanded(
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: const [SavedCarsList(), SavedPropertyTab()]),
                ),
              ],
            );
          } else {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: black)),
                      child: Image.asset(Assets.assetsWelcomePageEmptyList)),
                  const SizedBox(height: 50),
                  const Text(
                    "You are not Logged In \n Please Login",
                    style: secMed20,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// class CustomIndicator extends Decoration {
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return CustomIndiactorPainter();
//   }
// }

// class CustomIndiactorPainter extends BoxPainter {
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     final paint = Paint()
//       ..color = Colors.black // This sets the color of the line to black
//       ..strokeWidth = 2
//       ..style = PaintingStyle.fill;

//     final Rect rect =
//         Offset(offset.dx, -offset.dy) & Size(configuration.size!.width, 5);

//     canvas.drawRect(rect, paint);
//   }
// }
