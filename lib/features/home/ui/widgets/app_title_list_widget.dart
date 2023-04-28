import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:flutter/material.dart';

class AppTitleAndListWidget extends StatelessWidget {
  const AppTitleAndListWidget(
      {super.key,
      this.onViewAllTapped,
      required this.title,
      this.categoryBody});
  final Function()? onViewAllTapped;
  final String title;
  final Widget? categoryBody;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Text(
                title,
                style: sec_med_15,
              ),
            ),
            if (onViewAllTapped != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: appPadding),
                child: TextButton(
                  onPressed: onViewAllTapped,
                  child: const Text(kViewAll),
                ),
              ),
          ],
        ),
        Padding(
          padding: onViewAllTapped == null
              ? const EdgeInsets.symmetric(vertical: 7.0)
              : EdgeInsets.zero,
          child: const SizedBox(height: appTitleCategoryGap),
        ),
        if (categoryBody != null) categoryBody!,
      ],
    );
  }
}
