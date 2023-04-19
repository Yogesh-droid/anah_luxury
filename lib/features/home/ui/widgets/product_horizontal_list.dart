import 'package:anah_luxury/core/constants/strings.dart';
import 'package:flutter/material.dart';

class ProductHorizontalList extends StatelessWidget {
  const ProductHorizontalList(
      {super.key,
      this.onViewAllTapped,
      required this.title,
      this.categoryBody});
  final Function()? onViewAllTapped;
  final String title;
  final Widget? categoryBody;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            if (onViewAllTapped != null)
              TextButton(
                style: ButtonStyle(
                    textStyle:
                        MaterialStateProperty.resolveWith<TextStyle>((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const TextStyle(color: Colors.black);
                      }
                      return const TextStyle(color: Colors.grey);
                    }),
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey;
                      }
                      return Colors.transparent;
                    }),
                    splashFactory: NoSplash.splashFactory),
                onPressed: onViewAllTapped,
                child:
                    const Text(kViewAll, style: TextStyle(color: Colors.grey)),
              ),
          ],
        ),
        const SizedBox(height: 10),
        if (categoryBody != null) categoryBody!,
      ],
    );
  }
}
