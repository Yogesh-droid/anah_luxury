import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

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
    await Future.delayed(
        const Duration(seconds: 2), () => context.go(loginPageRoute));
  }
}