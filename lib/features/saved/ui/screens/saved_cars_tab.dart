import 'package:anah_luxury/features/saved/ui/widgets/cars_buying_list.dart';
import 'package:anah_luxury/features/saved/ui/widgets/cars_wishlist.dart';
import 'package:anah_luxury/features/saved/ui/widgets/test_drive_list.dart';
import 'package:flutter/material.dart';

class SavedCarsList extends StatelessWidget {
  const SavedCarsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [TestDriveList(), CarsBuyingList(), CarsWishlist()],
      ),
    );
  }
}
