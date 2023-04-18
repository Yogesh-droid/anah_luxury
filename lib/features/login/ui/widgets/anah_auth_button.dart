import 'package:flutter/material.dart';

class AnahAuthButton extends StatelessWidget {
  const AnahAuthButton(
      {Key? key,
      this.height,
      this.width,
      this.title,
      this.isFilled,
      this.fillColor,
      this.borderColor,
      this.trailingIcon,
      this.leadingIcon,
      this.onTap})
      : super(key: key);
  final double? height;
  final double? width;
  final String? title;
  final bool? isFilled;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: height ?? 44,
            width: width ?? MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              color: fillColor,
              border:
                  borderColor != null ? Border.all(color: borderColor!) : null,
            ),
            child: title != null
                ? Center(
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                          color:
                              isFilled != null ? Colors.black : Colors.white),
                    ),
                  )
                : const SizedBox()));
  }
}
