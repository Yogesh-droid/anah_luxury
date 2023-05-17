import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BrandsCard extends StatelessWidget {
  const BrandsCard(
      {super.key, this.id, required this.image, this.slug, this.onTap});
  final String? id;
  final String image;
  final String? slug;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        elevation: 2,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: CachedNetworkImage(imageUrl: image),
        )),
      ),
    );
  }
}
