import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/core/routes/routes.dart';
import 'package:anah_luxury/features/landing/ui/widgets/anah_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoggedOutProfilePageUi extends StatelessWidget {
  const LoggedOutProfilePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Image.asset(
                Assets.assetsProfileLoggedOutUiBg,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Text(
                kBookYourDreams,
                style: secMed48.copyWith(
                    color: white.withOpacity(0.6),
                    fontFamily: "PlayfairDisplay",
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
        const SizedBox(height: appWidgetGap),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AnahAuthButton(
                title: kLogin,
                borderColor: black,
                isFilled: false,
                height: 48,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  context.push(loginPageRoute);
                },
              ),
              const SizedBox(height: appPadding),
              AnahAuthButton(
                title: kSignUp,
                fillColor: black,
                height: 48,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  context.push(signPageRoute);
                },
              )
            ],
          ),
        ))
      ],
    );
  }
}
