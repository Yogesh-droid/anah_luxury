import 'package:anah_luxury/features/auth/login/ui/screens/login_screen.dart';
import 'package:anah_luxury/features/auth/sign_up/ui/screens/sign_up_screen.dart';
import 'package:anah_luxury/features/dashboard/ui/screens/dashboard.dart';
import 'package:anah_luxury/features/landing/ui/screens/landing_page.dart';
import 'package:anah_luxury/features/onboarding/ui/screens/welcome_page.dart';
import 'package:anah_luxury/features/product_details/ui/screen/car_detail_page.dart';
import 'package:anah_luxury/features/product_details/ui/screen/property_detail_page.dart';
import 'package:anah_luxury/features/product_listing/ui/screens/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/product_booking/ui/screens/product_booking_page.dart';

const String welcomePageRoute = '/';
const String landingPageRoute = '/landingPage';
const String loginPageRoute = '/loginPage';
const String signPageRoute = '/signUpPage';
const String dashBoardRoute = '/dashBoard';
const String productListRoute = '/productList';
const String carDetailRoute = '/carDetailPage';
const String propertyDetailRoute = '/propertyDetailPage';
const String productListPageName = "productListPage";
const String carDetailPageName = "carDetailPage";
const String propertyDetailPageName = "propertyDetailPage";
const String bookNowPageName = "bookNowPageName";
const String bookNowPageRoute = "/bookNowPageRoute";

final GoRouter router = GoRouter(
    initialLocation: welcomePageRoute,
    redirect: (_, state) async {
      if (state.subloc == welcomePageRoute ||
          state.subloc == landingPageRoute) {}
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: WelcomePage());
        },
      ),
      GoRoute(
        path: landingPageRoute,
        pageBuilder: (context, state) {
          return getTransition(
              child: const LandingPage(),
              animationType: TransitionType.fade,
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
      GoRoute(
        path: loginPageRoute,
        pageBuilder: (context, state) {
          return getTransition(
              child: const LoginScreen(),
              animationType: TransitionType.fade,
              duration: const Duration(milliseconds: 500));
        },
      ),
      GoRoute(
        path: signPageRoute,
        pageBuilder: (context, state) {
          return getTransition(
              child: const SignUpScreen(),
              animationType: TransitionType.fade,
              duration: const Duration(milliseconds: 500));
        },
      ),
      GoRoute(
        path: productListRoute,
        name: productListPageName,
        pageBuilder: (context, state) {
          return getTransition(
              child: ProductListPage(
                  query: state.queryParams['query']!,
                  name: state.queryParams['name'] ?? '',
                  category: state.queryParams['category']!),
              animationType: TransitionType.slide,
              duration: const Duration(milliseconds: 200));
        },
      ),
      GoRoute(
        path: carDetailRoute,
        name: carDetailPageName,
        pageBuilder: (context, state) {
          return getTransition(
              child: CarDetailPage(
                slug: state.queryParams['slug']!,
              ),
              animationType: TransitionType.fade,
              duration: const Duration(milliseconds: 200));
        },
      ),
      GoRoute(
        path: propertyDetailRoute,
        name: propertyDetailPageName,
        pageBuilder: (context, state) {
          return getTransition(
              child: PropertyDetailPage(
                slug: state.queryParams['slug']!,
              ),
              animationType: TransitionType.fade,
              duration: const Duration(milliseconds: 200));
        },
      ),
      GoRoute(
        path: bookNowPageRoute,
        name: bookNowPageName,
        pageBuilder: (context, state) {
          return getTransition(
              child: ProductBookingPage(
                category: state.queryParams['category']!,
                categoryId: state.queryParams['categoryId']!,
                productId: state.queryParams['productId']!,
              ),
              animationType: TransitionType.fade,
              duration: const Duration(milliseconds: 200));
        },
      ),
    ]);

Page<dynamic> getTransition(
    {required Widget child,
    Duration? duration,
    TransitionType? animationType}) {
  return CustomTransitionPage(
      child: child,
      transitionDuration: duration ?? const Duration(seconds: 1),
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
