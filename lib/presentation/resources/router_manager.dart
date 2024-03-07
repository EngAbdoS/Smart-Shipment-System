import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/presentation/authenticathion/authView/auth_view.dart';
import 'package:smart_shipment_system/presentation/authenticathion/clientAuth/client_auth_view.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryAuth/deliveryAuthView.dart';
import 'package:smart_shipment_system/presentation/onboarding/view/onBoardingView.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/splachScreen/splash_screen_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String noRoute = "/noRoute";
  static const String deliveryHomeRoute = "/deliveryHome";
  static const String clientHomeRoute = "/clientHome";
  static const String onBoardingViewRoute = "/onBoardingView";
  static const String loginViewRoute = "/loginView";
  static const String authViewRoute = "/authView";
  static const String deliveryAuthViewRoute = "/deliveryAuthView";
  static const String deliveryRegistrationViewRoute =
      "/deliveryRegistrationView";
  static const String deliveryLoginViewRoute = "/deliveryLoginView";
  static const String clientAuthViewRoute = "/clientAuthView";
  static const String clientRegistrationViewRoute = "/clientRegistrationView";
  static const String clientLoginViewRoute = "/clientLoginView";
}

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashRoute,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(
              milliseconds: AppConstants.transitionDurationMillySeconds),
          key: state.pageKey,
          child: SplashScreenView(), // const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: Routes.onBoardingViewRoute,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(milliseconds: 1000),
          key: state.pageKey,
          child: OnBoardingView(), // const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: Routes.onBoardingViewRoute,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(
              milliseconds: AppConstants.transitionDurationMillySeconds),
          key: state.pageKey,
          child: Container(
            color: Colors.red,
          ), // const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: Routes.authViewRoute,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(
              milliseconds: AppConstants.transitionDurationMillySeconds),
          key: state.pageKey,
          child: const AuthenticationView(), // const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: Routes.deliveryAuthViewRoute,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(
              milliseconds: AppConstants.transitionDurationMillySeconds),
          key: state.pageKey,
          child: const DeliveryAuthView(), // const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: Routes.clientAuthViewRoute,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(
              milliseconds: AppConstants.transitionDurationMillySeconds),
          key: state.pageKey,
          child: const ClientAuthView(), // const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: Routes.noRoute,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(
              milliseconds: AppConstants.transitionDurationMillySeconds),
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
