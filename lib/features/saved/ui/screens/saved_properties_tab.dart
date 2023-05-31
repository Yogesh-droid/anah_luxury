import 'package:anah_luxury/features/saved/ui/widgets/tours_buyinglist.dart';
import 'package:anah_luxury/features/saved/ui/widgets/tours_list.dart';
import 'package:flutter/material.dart';

import '../widgets/tours_wishlist.dart';

class SavedPropertyTab extends StatelessWidget {
  const SavedPropertyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(children: [ToursList(), ToursBuyingList(), ToursWishList()]),
    );
  }
}
