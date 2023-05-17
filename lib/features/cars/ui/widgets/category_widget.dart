import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, this.slug, this.title, this.image, this.id, this.onTap});
  final String? slug;
  final String? title;
  final String? image;
  final String? id;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: black,
          image: DecorationImage(
              fit: BoxFit.fill,
              opacity: 0.2,
              image: CachedNetworkImageProvider(image ?? ''))),
      child: Center(
        child: Text(
          title ?? '',
          style: secMed15.copyWith(fontFamily: 'PlayfairDisplay', color: white),
        ),
      ),
    );
  }
}
