import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginBtn extends StatelessWidget {
  const SocialLoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SvgPicture.asset(
        Assets.assetsLoginFacebookIcon,
        // ignore: deprecated_member_use
        color: white,
      ),
      SvgPicture.asset(
        Assets.assetsLoginGoogleIcon,
        // ignore: deprecated_member_use
        color: white,
      ),
      SvgPicture.asset(
        Assets.assetsLoginAppleIcon,
        // ignore: deprecated_member_use
        color: white,
      ),
    ]);
  }
}
