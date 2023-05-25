import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:flutter/material.dart';

class BookNowWidget extends StatelessWidget {
  const BookNowWidget(
      {super.key, required this.bookingPrice, required this.onTap});
  final String bookingPrice;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: appPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(kBookNow, style: secMed14),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(secMed10.copyWith(
                        foreground: Paint()..color = grey2,
                        decoration: TextDecoration.underline,
                        decorationColor: grey2)),
                    splashFactory: NoSplash.splashFactory,
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.transparent)),
                child: const Text(kTnC),
              )
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(bookingPrice, style: secMed14),
              Text(kRefundable, style: secMed10.copyWith(color: grey2))
            ])
          ],
        ),
      ),
    );
  }
}
