import 'dart:ui';

import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          Container(
            color: black.withOpacity(0.6),
            height: double.maxFinite,
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.back,
                          color: white,
                        )),
                    const Text(kLoginIntoYourAccount)
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
