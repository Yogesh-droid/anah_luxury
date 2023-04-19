// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/constants/assets.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
    required this.productName,
    required this.onProductTapped,
    this.backgroundImage,
    this.height,
    this.width,
    this.specifications,
    this.currency,
    this.discount,
    this.netPrice,
  }) : super(key: key);
  final String productName;
  final Function() onProductTapped;
  final String? backgroundImage;
  final double? height;
  final double? width;
  final List<String>? specifications;
  final String? currency;
  final String? discount;
  final String? netPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (backgroundImage != null)
          SizedBox(
            height: height,
            width: width,
            child: FadeInImage(
                fit: BoxFit.cover,
                placeholder:
                    const AssetImage(Assets.assetsHomePageImageLoading),
                image: NetworkImage(backgroundImage!)),
          ),
        const SizedBox(height: 10),
        Text(
          productName,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        if (specifications != null)
          Wrap(
            children: specifications!.map((e) => Text(e)).toList(),
          ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (currency != null)
              Text(currency!,
                  style: const TextStyle(color: Colors.black, fontSize: 16)),
            if (netPrice != null)
              Text(netPrice!,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough)),
            if (discount != null)
              Text('${discount!}% off',
                  style: const TextStyle(color: Colors.green, fontSize: 12))
          ],
        )
      ],
    );
  }
}
