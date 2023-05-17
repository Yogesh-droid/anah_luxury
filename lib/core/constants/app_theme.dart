import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme(BuildContext context) {
    return ThemeData(
        primaryColor: const Color(0xFF212121),
        fontFamily: 'Inter',

        ///  below code is for TextButton  ////
        /// You can define your custom theme if you need by applying .copyWith method
        ///
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) =>
                    states.contains(MaterialState.pressed)
                        ? grey5
                        : transparent),
                textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle()
                        .copyWith(foreground: Paint()..color = black)),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 14)),
                overlayColor: MaterialStateProperty.all(grey5))),

        /// below is code for outlined button ////
        ///

        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(hover),
                side:
                    MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed) ? const BorderSide(color: hover) : const BorderSide(color: black)),
                backgroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed) ? hover : black),
                textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle().copyWith(foreground: Paint()..color = white, fontSize: 15, fontWeight: FontWeight.w400)),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 20)))),
        appBarTheme: AppBarTheme(iconTheme: const IconThemeData().copyWith(color: black), titleTextStyle: secMed15.copyWith(fontFamily: "PlayfairDisplay", fontSize: 16, fontWeight: FontWeight.w500)));
  }
}
