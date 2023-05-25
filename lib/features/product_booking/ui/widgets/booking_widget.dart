import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/booking_form.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/booking_page_title_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';

class BookingWidget extends StatelessWidget {
  const BookingWidget({super.key, required this.category});
  final String category;
  static final _bookingFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BookingPageTitleWidget(
              assetsPath: category == kCars
                  ? Assets.assetsBookingDriveIcon
                  : Assets.assetsBookingHouseTourIcon,
              title: category == kCars ? kBookTestDrive : kBookHouseTour,
              subtitle: category == kCars ? kGetBehindWheels : kStepInsideHome),
          const SizedBox(height: appWidgetGap),
          Padding(
            padding: const EdgeInsets.all(appPadding),
            child: BookingForm(bookingFormKey: _bookingFormKey),
          ),
        ],
      ),
    );
  }
}
