import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/hive/local_storage.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/menu/ui/controllers/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoreOptionButton(title: kMyOrders, onTap: () {}),
        MoreOptionButton(title: kMyWishList, onTap: () {}),
        MoreOptionButton(title: kSettings, onTap: () {}),
        MoreOptionButton(title: kHelpAndFeedBack, onTap: () {}),
        MoreOptionButton(title: kPrivacyPolicy, onTap: () {}),
        MoreOptionButton(title: kTnC, onTap: () {}),
        MoreOptionButton(
          title: kLogout,
          onTap: () {
            LocalStorage.instance.token = null;
            context.read<ProfileBloc>().add(GetProfileEvent());
            LocalStorage.instance.deleteToken();
          },
          trailing: const Icon(
            Icons.logout,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class MoreOptionButton extends StatelessWidget {
  const MoreOptionButton(
      {super.key, required this.title, required this.onTap, this.trailing});
  final String title;
  final Function() onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding, vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: secMed14,
        ),
        onTap: () {
          onTap();
        },
        tileColor: grey8,
        trailing: trailing ?? const Icon(Icons.keyboard_arrow_right_outlined),
      ),
    );
  }
}
