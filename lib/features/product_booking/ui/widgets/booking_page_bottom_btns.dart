import 'package:anah_luxury/core/routes/routes.dart';
import 'package:anah_luxury/features/product_booking/ui/controllers/booking_pagecontroller_index_cubit.dart';
import 'package:anah_luxury/features/product_booking/ui/controllers/cubit/book_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/constants/strings.dart';
import '../../../landing/ui/widgets/anah_auth_button.dart';

class BookingPageBottomBtns extends StatelessWidget {
  const BookingPageBottomBtns(
      {super.key,
      required this.onNextTap,
      required this.onCancelTap,
      required this.onPreviousTap,
      required this.onBookTap});
  final Function() onNextTap;
  final Function() onBookTap;
  final Function() onCancelTap;
  final Function() onPreviousTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: white, boxShadow: [
        BoxShadow(color: grey5, blurRadius: 5, offset: Offset(0, -5))
      ]),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: appPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<BookingPageControllerIndexCubit, int>(
              builder: (context, state) {
                return AnahAuthButton(
                  borderColor: black,
                  isFilled: false,
                  title: state == 1 ? kPrevious : kCancel,
                  onTap: () => state == 1 ? onPreviousTap() : onCancelTap(),
                  width: MediaQuery.of(context).size.width / 2.5,
                );
              },
            ),
            BlocBuilder<BookProductCubit, BookProductState>(
              builder: (context, state) {
                if (state is ProductBookingInProgress) {
                  return AnahAuthButton(
                    borderColor: black,
                    fillColor: black,
                    title: "In Progress...",
                    width: MediaQuery.of(context).size.width / 2.5,
                  );
                } else if (state is ProductBookedSuccessState) {
                  // ScaffoldMessenger.of(context)
                  //     .showSnackBar(SnackBar(content: Text(state.message)));
                  context.pushReplacementNamed(savedPageName);
                }
                return BlocBuilder<BookingPageControllerIndexCubit, int>(
                  builder: (context, state) {
                    return AnahAuthButton(
                      borderColor: black,
                      fillColor: black,
                      title: state == 1 ? kBook : kNext,
                      onTap: () => state == 1 ? onBookTap() : onNextTap(),
                      width: MediaQuery.of(context).size.width / 2.5,
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
