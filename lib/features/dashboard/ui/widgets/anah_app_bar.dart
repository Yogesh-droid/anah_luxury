import 'package:anah_luxury/core/constants/assets.dart';
import 'package:flutter/material.dart';

class AnahAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnahAppBar({super.key, this.actions});
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          Assets.assetsWelcomePageAnah,
          color: Colors.black,
        ),
      ),
      leadingWidth: 100,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AnahSecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnahSecondaryAppBar({super.key, this.actions, this.title});
  final List<Widget>? actions;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
      title: Text(title ?? ''),
      automaticallyImplyLeading: true,
      
      leadingWidth: 100,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
