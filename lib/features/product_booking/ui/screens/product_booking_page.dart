import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/dashboard/ui/widgets/anah_app_bar.dart';
import 'package:anah_luxury/features/product_booking/ui/controllers/booking_pagecontroller_index_cubit.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/booking_calender.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/booking_page_bottom_btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/booking_widget.dart';

class ProductBookingPage extends StatelessWidget {
  ProductBookingPage({super.key, required this.category});
  final String category;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      BookingWidget(category: category),
      const BookingCalender()
    ];
    return Scaffold(
        appBar: const AnahSecondaryAppBar(title: kBooking),
        body: PageView.builder(
          itemCount: 2,
          controller: pageController,
          itemBuilder: (context, index) {
            context.read<BookingPageControllerIndexCubit>().changeIndex(index);
            return pages[index];
          },
        ),
        bottomNavigationBar: BookingPageBottomBtns(
          onNextTap: () {
            pageController.nextPage(
                duration: const Duration(microseconds: 500),
                curve: Curves.decelerate);
          },
          onCancelTap: () {
            Navigator.pop(context);
          },
          onPreviousTap: () {
            pageController.previousPage(
                duration: const Duration(microseconds: 500),
                curve: Curves.decelerate);
          },
        ));
  }
}
