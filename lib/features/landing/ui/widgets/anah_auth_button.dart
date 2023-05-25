import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AnahAuthButton extends StatelessWidget {
  const AnahAuthButton({
    Key? key,
    this.height,
    this.width,
    this.title,
    this.isFilled,
    this.fillColor,
    this.borderColor,
    this.trailingIcon,
    this.leadingIcon,
    this.onTap,
  }) : super(key: key);
  final double? height;
  final double? width;
  final String? title;
  final bool? isFilled;

  /// isFilled decides color of text on button
  final Color? fillColor;
  final Color? borderColor;
  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 44,
      width: width ?? MediaQuery.of(context).size.width - 100,
      child: OutlinedButton(
        onPressed: onTap,
        style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
            backgroundColor:
                MaterialStateProperty.all(fillColor ?? transparent),
            textStyle: MaterialStateProperty.all(const TextStyle().copyWith(
                foreground: Paint()..color = isFilled != null ? black : white)),
            side: MaterialStateProperty.all(
                BorderSide(color: borderColor ?? transparent)),
            overlayColor: fillColor == null
                ? const MaterialStatePropertyAll<Color>(grey5)
                : null),
        child: Text(
          title ?? '',
        ),
      ),
    );
  }
}
