import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/dashboard/ui/widgets/anah_app_bar.dart';
import 'package:anah_luxury/features/product_booking/ui/controllers/booking_pagecontroller_index_cubit.dart';
import 'package:anah_luxury/features/product_booking/ui/controllers/country_code_controller.dart';
import 'package:anah_luxury/features/product_booking/ui/controllers/cubit/book_product_cubit.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/booking_calender.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/booking_page_bottom_btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/booking_widget.dart';

class ProductBookingPage extends StatelessWidget {
  ProductBookingPage(
      {super.key,
      required this.category,
      required this.categoryId,
      required this.productId});
  static final _bookingFormKey = GlobalKey<FormState>();
  final String category;
  final String categoryId;
  final String productId;
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController mobileNoTextcontroller = TextEditingController();

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      BookingWidget(
          category: category,
          bookingFormKey: _bookingFormKey,
          emailTextController: emailTextController,
          mobileNoTextcontroller: mobileNoTextcontroller,
          nameTextController: nameTextController,
          lastNameController: lastNameController),
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
            if (_bookingFormKey.currentState!.validate()) {
              var productBookCubit = context.read<BookProductCubit>();
              productBookCubit.productId = productId;
              productBookCubit.categoryId = categoryId;
              productBookCubit.firstName = nameTextController.text;
              productBookCubit.email = emailTextController.text;
              productBookCubit.lastName = lastNameController.text;
              productBookCubit.mobileNo =
                  context.read<CountryCodeController>().state.dialCode! +
                      mobileNoTextcontroller.text;
              pageController.nextPage(
                  duration: const Duration(microseconds: 500),
                  curve: Curves.decelerate);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please fill mendatory fields")));
            }
          },
          onBookTap: () {
            context.read<BookProductCubit>().bookProduct();
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
