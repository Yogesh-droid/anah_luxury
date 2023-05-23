import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spaces.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/constants/text_tyles.dart';
import '../widgets/login_form.dart';

class LoginForeground extends StatelessWidget {
  const LoginForeground({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: appPadding),
        color: black.withOpacity(0.8),
        height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              kLoginIntoYourAccount,
              style: secMed32.copyWith(
                  color: white,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Spacer(),
          LoginForm()
        ]),
      ),
    );
  }
}
