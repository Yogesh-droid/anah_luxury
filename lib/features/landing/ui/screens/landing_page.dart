//**
// This page is landing page where we display login and create account options to user

// */

import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/landing/ui/controllers/cubit/banner_text_controller_cubit.dart';
import 'package:anah_luxury/features/landing/ui/widgets/auth_button_views.dart';
import 'package:anah_luxury/features/landing/ui/widgets/login_background_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            background(context),
            const LandingBackground(),
            const LandingForeground()
          ],
        ),
      ),
    );
  }

  Widget background(BuildContext context) {
    return const LoginBackgroundDecoration();
  }
}

class LandingForeground extends StatefulWidget {
  const LandingForeground({super.key});

  @override
  State<LandingForeground> createState() => _LandingForegroundState();
}

class _LandingForegroundState extends State<LandingForeground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<Offset>(
            begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
        .animate(_controller);

    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                Assets.assetsWelcomePageAnah,
                color: Colors.white,
                height: 50,
                width: 120,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            BlocBuilder<BannerTextControllerCubit, String>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: state == "Luxury Homes"
                      ? Text(
                          key: const ValueKey<String>("Homes"),
                          state,
                          textAlign: TextAlign.start,
                          style: sec_med_36.copyWith(
                              fontFamily: "PlayfairDisplay",
                              color: white,
                              fontWeight: FontWeight.w600))
                      : Text(
                          key: const ValueKey<String>("Cars"),
                          state,
                          textAlign: TextAlign.start,
                          style: sec_med_36.copyWith(
                              fontFamily: "PlayfairDisplay",
                              color: white,
                              fontWeight: FontWeight.w600),
                        ),
                );
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                '''Discover new collection from all over the globe everyday with ANAH''',
                style: sec_med_15.copyWith(color: white),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: _animation,
                child: const AuthButtonViews(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LandingBackground extends StatefulWidget {
  const LandingBackground({super.key});

  @override
  State<LandingBackground> createState() => _LandingBackgroundState();
}

class _LandingBackgroundState extends State<LandingBackground>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _animation = Tween<Offset>(
            begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
        .animate(_controller);
    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: CustomPaint(
        painter: DiagonalPainter(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black45;
    canvas.drawPath(
      Path()
        ..moveTo(-400, 0)
        ..lineTo(size.width * 0.5, 0)
        ..lineTo(size.width, size.height * 0.5)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width * 0.3, size.height)
        ..lineTo(0, size.height * 0.7)
        ..close(),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
