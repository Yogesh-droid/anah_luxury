// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/constants/assets.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {Key? key,
      required this.title,
      required this.onCategoryTapped,
      this.isTextCentered,
      this.backgroundImage,
      this.height,
      this.width,
      this.shadeColor,
      this.textStyle,
      this.shadeOpacity,
      this.slug, this.name})
      : super(key: key);
  final String title;
  final Function(String? slug,String? name) onCategoryTapped;
  final bool? isTextCentered;
  final String? backgroundImage;
  final double? height;
  final double? width;
  final Color? shadeColor;
  final TextStyle? textStyle;
  final double? shadeOpacity;
  final String? slug;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryTapped(slug,name);
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: backgroundImage != null
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: FadeInImage.assetNetwork(
                      placeholder: Assets.assetsHomePageImageLoading,
                      image: backgroundImage!,
                    ).image)
                : null),
        child: Container(
          color: shadeColor != null
              ? shadeColor!.withOpacity(shadeOpacity ?? 0.5)
              : null,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: textStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
