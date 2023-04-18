import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/features/login/ui/widgets/auth_button_views.dart';
import 'package:anah_luxury/features/login/ui/widgets/login_background_decoration.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            background(context),
            backGroundColor(context),
            foreground()
          ],
        ),
      ),
    );
  }

  Widget background(BuildContext context) {
    return const LoginBackgroundDecoration();
  }

  Widget foreground() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              Assets.assetsWelcomePageAnah,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const AuthButtonViews(),
        ],
      ),
    );
  }

  Widget backGroundColor(BuildContext context) {
    return CustomPaint(
      painter: DiagonalPainter(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        ..moveTo(0, 0)
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
