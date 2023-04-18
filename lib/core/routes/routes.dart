import 'package:anah_luxury/features/dashboard/ui/screens/dashboard.dart';
import 'package:anah_luxury/features/login/ui/screens/login_page.dart';
import 'package:anah_luxury/features/onboarding/ui/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String welcomePageRoute = '/';
const String loginPageRoute = '/loginPage';
const String dashBoardRoute = '/dashBoard';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) {
      return const MaterialPage(child: WelcomePage());
    },
  ),
  GoRoute(
    path: loginPageRoute,
    pageBuilder: (context, state) {
      return getTransition(
          child: const LoginPage(),
          animationType: TransitionType.slide,
          duration: const Duration(milliseconds: 500));
    },
  ),
  GoRoute(
    path: dashBoardRoute,
    pageBuilder: (context, state) {
      return getTransition(
          child: const DashBoard(),
          animationType: TransitionType.fade,
          duration: const Duration(milliseconds: 500));
    },
  ),
]);

Page<dynamic> getTransition(
    {required Widget child,
    Duration? duration,
    TransitionType? animationType}) {
  return CustomTransitionPage(
      child: child,
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        switch (animationType) {
          /**
               * this is for sliding animation for a page to enter in stack
               * 
               * you can change offset to set enter position accordingly
               */
          case TransitionType.slide:
            return SlideTransition(
                position: animation.drive(
                  Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeIn)),
                ),
                child: child);

          /**
                 * this is fade animation
                 */
          case TransitionType.fade:
            return FadeTransition(opacity: animation, child: child);

          /**
               * this is scale transtion
               */

          case TransitionType.scale:
            return ScaleTransition(scale: animation, child: child);

          /**
                 * this is rotation transition
                 * 
                 */

          case TransitionType.rotation:
            return RotationTransition(
              turns: animation,
              child: child,
            );

          default:
            return child;
        }
      });
}

enum TransitionType { fade, scale, slide, rotation, none }
