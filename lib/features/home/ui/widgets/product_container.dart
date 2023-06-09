// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer(
      {Key? key,
      required this.productName,
      required this.onProductTapped,
      this.backgroundImage,
      this.height,
      this.width,
      this.specifications,
      this.currency,
      this.discount,
      this.netPrice,
      this.wishListIcon,
      this.onWishListTapped,
      this.slug,
      this.category})
      : super(key: key);
  final String productName;
  final Function(String? category, String? slug) onProductTapped;
  final String? backgroundImage;
  final double? height;
  final double? width;
  final List<String>? specifications;
  final String? currency;
  final String? discount;
  final String? netPrice;
  final bool? wishListIcon;
  final Function()? onWishListTapped;
  final String? category;
  final String? slug;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onProductTapped(category, slug);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (backgroundImage != null)
              Stack(
                children: [
                  SizedBox(
                    width: width,
                    height: height,
                    child: FadeInImage(
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                        placeholder:
                            const AssetImage(Assets.assetsHomePageImageLoading),
                        image: NetworkImage(backgroundImage!)),
                  ),
                  if (onWishListTapped != null)
                    Container(
                      decoration: BoxDecoration(
                          color: grey2.withOpacity(0.7),
                          shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {
                            onWishListTapped!();
                          },
                          icon: const Icon(Icons.favorite_border,
                              color: white, size: 35)),
                    )
                ],
              ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.01)),
            SizedBox(
              width: width,
              child: Text(productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: secMed15.copyWith(
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.005)),
            if (specifications != null)
              Wrap(
                children: specifications!
                    .map((e) => Text(
                          e,
                          style: secMed12.copyWith(color: darkGrey),
                        ))
                    .toList(),
              ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.005)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (currency != null)
                  Text(currency!,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 16)),
                const SizedBox(width: 5),
                if (netPrice != null)
                  Text(netPrice!,
                      style: const TextStyle(color: Colors.grey, fontSize: 12)),
                if (discount != null)
                  Text('${discount!}% off',
                      style: const TextStyle(color: Colors.green, fontSize: 12))
              ],
            )
          ],
        ),
      ),
    );
  }
}
