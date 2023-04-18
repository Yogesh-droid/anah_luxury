import 'package:flutter/material.dart';

import '../widgets/anah_app_bar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: getAppBar());
  }

  AnahAppBar getAppBar() {
    return const AnahAppBar(actions: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.notifications_outlined,
          color: Colors.black,
        ),
      ),
    ]);
  }
}
