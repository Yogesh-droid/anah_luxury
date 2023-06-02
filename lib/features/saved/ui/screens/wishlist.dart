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
    useId = //context.read<ProfileBloc>().profileEntity.sId ??
        '642d690612cfc21ec8622bbd';
    tabController = TabController(
        length: 2, vsync: this, animationDuration: const Duration(seconds: 1));
    testDriveBloc.add(GetTestDriveAndToursList(categorySlug: 'cars'));
    wishListControllerBloc.add(GetWishListEvent(slug: 'cars', userId: useId));
    buyingListBloc.add(GetBuyingListEvent(slug: 'cars', userId: useId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        children: [
          TabBar(
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
            onTap: (value) {
              if (value == 0) {
                if (testDriveBloc.testDriveList.isEmpty) {
                  testDriveBloc
                      .add(GetTestDriveAndToursList(categorySlug: 'cars'));
                }
                if (buyingListBloc.carBuyingList.isEmpty) {
                  buyingListBloc
                      .add(GetBuyingListEvent(slug: 'cars', userId: useId));
                }
                if (wishListControllerBloc.carsWishList.isEmpty) {
                  wishListControllerBloc
                      .add(GetWishListEvent(slug: 'cars', userId: useId));
                }
              } else {
                if (testDriveBloc.toursList.isEmpty) {
                  testDriveBloc.add(
                      GetTestDriveAndToursList(categorySlug: 'real-estate'));
                }
                if (buyingListBloc.propertyBuyingList.isEmpty) {
                  buyingListBloc.add(
                      GetBuyingListEvent(slug: 'real-estate', userId: useId));
                }
                if (wishListControllerBloc.toursWishList.isEmpty) {
                  wishListControllerBloc.add(
                      GetWishListEvent(slug: 'real-estate', userId: useId));
                }
              }
            },
          ),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: const [SavedCarsList(), SavedPropertyTab()]),
          ),
        ],
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
