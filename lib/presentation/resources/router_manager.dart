import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String noRoute = "/noRoute";
  static const String deliveryHomeRoute = "/deliveryHome";
  static const String clientHomeRoute = "/clientHome";
  static const String onBoardingViewRoute = "/onBoardingView";
  static const String loginViewRoute = "/loginView";
  static const String registerViewRoute = "/registerView";
}

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashRoute,
        //builder: (context, state) => const SplashView(),
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: Container(), // const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: Routes.noRoute,
        //builder: (context, state) => const SplashView(),
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.noRouteFound),
            ),
            body: const Center(
              child: Text(AppStrings.noRouteFound),
            ),
          ), // const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
    ],
  );
}
