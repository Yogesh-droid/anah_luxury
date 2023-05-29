import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/menu/domain/entities/profile_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/assets.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(this.profileEntity, {super.key});

  final ProfileEntity profileEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(appPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(appPadding),
                decoration: BoxDecoration(
                    color: grey5, borderRadius: BorderRadius.circular(10)),
                child: profileEntity.profilePic != null
                    ? CachedNetworkImage(imageUrl: profileEntity.profilePic!)
                    : SvgPicture.asset(
                        Assets.assetsProfilePersonIcon,
                        // ignore: deprecated_member_use
                        color: grey2,
                      )),
            const SizedBox(width: appPadding),
            if (profileEntity.name != null && profileEntity.name!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileEntity.name ?? '',
                    style: secMed15,
                  ),
                  Text(
                    profileEntity.email ?? '',
                    style: secMed15,
                  )
                ],
              ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                iconSize: 18,
                color: black)
          ],
        ));
  }
}
