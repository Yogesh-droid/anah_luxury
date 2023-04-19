// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
    required this.title,
    required this.onCategoryTapped,
    this.isTextCentered,
    this.backgroundImage,
    this.height,
    this.width,
    this.shadeColor,
    this.textStyle,
    this.shadeOpacity,
  }) : super(key: key);
  final String title;
  final Function() onCategoryTapped;
  final bool? isTextCentered;
  final String? backgroundImage;
  final double? height;
  final double? width;
  final Color? shadeColor;
  final TextStyle? textStyle;
  final double? shadeOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: backgroundImage != null
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    backgroundImage!,
                  ))
              : null),
      child: Container(
        color: shadeColor != null
            ? shadeColor!.withOpacity(shadeOpacity ?? 0.5)
            : null,
        child: Center(
            child: Text(
          title,
          style: textStyle ??
              const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
