import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/authView/auth_view.dart';
import 'package:smart_shipment_system/presentation/authenticathion/authView/client_auth_view.dart';
import 'package:smart_shipment_system/presentation/authenticathion/authView/deliveryAuthView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/changePassword/view/changePasswordView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/clientRegistration/view/clientRegistrationView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/views/deliveryExternalRegistrationView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/views/deliveryInteriorRegistrationView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/views/deliveryRegistrationRoleView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/views/deliveryRegistrationView1.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/views/deliveryRegistrationView2.dart';
import 'package:smart_shipment_system/presentation/authenticathion/forgetPassword/view/forgetPasswordView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/login/view/loginView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/verification/view/verificationView.dart';
import 'package:smart_shipment_system/presentation/client/home/view/clientHomeView.dart';
import 'package:smart_shipment_system/presentation/onboarding/view/onBoardingView.dart';
import 'package:smart_shipment_system/presentation/resources/page_transition_manager.dart';
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
  static const String deliveryRegistrationView1Route =
      "/deliveryRegistration1View";
  static const String deliveryRegistrationView2Route =
      "/deliveryRegistration2View";
  static const String deliveryRegistrationRoleViewRoute =
      "/deliveryRegistrationRoleView";
  static const String deliveryInteriorRegistrationViewRoute =
      "/deliveryInteriorRegistrationView";
  static const String deliveryExternalRegistrationViewRoute =
      "/deliveryExternalRegistrationView";
  static const String clientAuthViewRoute = "/clientAuthView";
  static const String clientRegistrationViewRoute = "/clientRegistrationView";
  static const String forgotPasswordViewRoute = "/forgotPasswordView";
  static const String changePasswordViewRoute = "/changePasswordView";
  static const String emilVerificationViewRoute = "/emilVerificationView";
}

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.clientHomeRoute,
        pageBuilder: (context, state) {
          initClientHomeModule();
          return customPageTransition(
              state.pageKey, ClientHomeView(), fadeTransitionGlobal);
        },
      ),
      GoRoute(
        path: Routes.splashRoute,
        pageBuilder: (context, state) =>
            customPageTransition(
                state.pageKey, SplashScreenView(), fadeTransitionGlobal),
      ),
      GoRoute(
        path: Routes.onBoardingViewRoute,
        pageBuilder: (context, state) =>
            customPageTransition(
                state.pageKey, OnBoardingView(), fadeTransitionGlobal),
      ),
      GoRoute(
        path: Routes.authViewRoute,
        pageBuilder: (context, state) =>
            customPageTransition(
                state.pageKey, const AuthenticationView(),
                fadeTransitionGlobal),
      ),
      GoRoute(
        path: Routes.deliveryAuthViewRoute,
        pageBuilder: (context, state) =>
            customPageTransition(
                state.pageKey, const DeliveryAuthView(), fadeTransitionGlobal),
      ),
      GoRoute(
        path: Routes.clientAuthViewRoute,
        pageBuilder: (context, state) =>
            customPageTransition(
                state.pageKey, const ClientAuthView(), fadeTransitionGlobal),
      ),
      GoRoute(
        path: Routes.loginViewRoute,
        pageBuilder: (context, state) {
          initLoginModule();
          return customPageTransition(
              state.pageKey, LoginView(), fadeTransitionGlobal);
        },
      ),
      GoRoute(
        path: Routes.clientRegistrationViewRoute,
        pageBuilder: (context, state) {
          initClientRegistrationModule();
          return customPageTransition(
              state.pageKey, ClientRegistrationView(), slideTransitionLeft);
        },
      ),
      GoRoute(
        path: Routes.deliveryRegistrationView1Route,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return customPageTransition(state.pageKey,
              DeliveryRegistrationView1(), slideTransitionForRegistration);
        },
      ),
      GoRoute(
        path: Routes.deliveryRegistrationView2Route,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return customPageTransition(state.pageKey,
              DeliveryRegistrationView2(), slideTransitionForRegistration);
        },
      ),
      GoRoute(
        path: Routes.deliveryRegistrationRoleViewRoute,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return customPageTransition(state.pageKey,
              DeliveryRegistrationRoleView(), slideTransitionForRegistration);
        },
      ),
      GoRoute(
        path: Routes.deliveryInteriorRegistrationViewRoute,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return customPageTransition(
              state.pageKey,
              DeliveryInteriorRegistrationView(),
              slideTransitionForRegistration);
        },
      ),
      GoRoute(
        path: Routes.deliveryExternalRegistrationViewRoute,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return customPageTransition(
              state.pageKey,
              DeliveryExternalRegistrationView(),
              slideTransitionForRegistration);
        },
      ),
      GoRoute(
        path: Routes.forgotPasswordViewRoute,
        pageBuilder: (context, state) {
          initForgotPasswordModule();
          return customPageTransition(
              state.pageKey, ForgotPasswordView(), fadeTransitionGlobal);
        },
      ),
      GoRoute(
        path: Routes.changePasswordViewRoute,
        pageBuilder: (context, state) {
          return customPageTransition(
              state.pageKey, ChangePasswordView(), fadeTransitionGlobal);
        },
      ),
      GoRoute(
        path: Routes.emilVerificationViewRoute,
        pageBuilder: (context, state) {
          return customPageTransition(
              state.pageKey, EmailVerificationView(), fadeTransitionGlobal);
        },
      ),
      GoRoute(
        path: Routes.noRoute,
        pageBuilder: (context, state) =>
            CustomTransitionPage<void>(
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
              ),
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
      ),
    ],
  );
}
