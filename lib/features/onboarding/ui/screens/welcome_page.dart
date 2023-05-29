//**
// This is where we show Anah logo having wavy shimmer
// */

import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/core/routes/routes.dart';
import 'package:anah_luxury/features/menu/ui/controllers/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/hive/local_storage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    appStartUp(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: Colors.grey.shade200,
            child: Image.asset(Assets.assetsWelcomePageAnah)),
      ),
    );
  }

  Future<void> appStartUp(BuildContext context) async {
    await LocalStorage.instance.getToken().then((value) {
      if (value.isEmpty) {
        context.go(landingPageRoute);
      } else {
        debugPrint("token is =>=>=>=>  $value");
        context.go(dashBoardRoute);
        context.read<ProfileBloc>().add(GetProfileEvent());
      }
    });
  }
}
