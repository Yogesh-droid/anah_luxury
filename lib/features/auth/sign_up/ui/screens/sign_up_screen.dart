import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/spaces.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/constants/text_tyles.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.assetsLoginBg1),
                      fit: BoxFit.fill)),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              )),
          SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: appPadding),
                color: black.withOpacity(0.8),
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
          )
        ],
      ),
    );
  }
}
