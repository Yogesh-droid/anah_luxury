import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spaces.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/constants/text_tyles.dart';
import '../widgets/sign_up_form.dart';

class SignUpForeground extends StatelessWidget {
  const SignUpForeground({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: appPadding),
          color: black.withOpacity(0.8),
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: appWidgetGap * 2,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                CupertinoIcons.back,
                color: white,
              ),
            ),
            const SizedBox(
              height: appWidgetGap,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                kCreateYourAccount,
                style: secMed32.copyWith(
                    color: white,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Spacer(),
            SignUpForm()
          ]),
        ),
      ),
    );
  }
}
