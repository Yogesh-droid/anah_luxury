import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_tyles.dart';

class BookingPageTitleWidget extends StatelessWidget {
  const BookingPageTitleWidget(
      {super.key,
      required this.assetsPath,
      required this.title,
      required this.subtitle});
  final String assetsPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(assetsPath, height: 100, width: 100),
        Text(title,
            style: secMed18.copyWith(
                fontFamily: "PlayfairDisplay", fontWeight: FontWeight.w600)),
        Text(subtitle,
            style: secMed12.copyWith(color: grey3), textAlign: TextAlign.center)
      ],
    );
  }
}
