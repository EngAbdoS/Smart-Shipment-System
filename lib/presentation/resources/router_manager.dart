import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/authView/auth_view.dart';
import 'package:smart_shipment_system/presentation/authenticathion/authView/client_auth_view.dart';
import 'package:smart_shipment_system/presentation/authenticathion/authView/deliveryAuthView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/changePassword/view/changePasswordView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/clientRegistration/view/clientRegistrationView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/views/deliveryInteriorRegistrationView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/views/deliveryRegistrationRoleView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/views/deliveryRegistrationView1.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/views/deliveryRegistrationView2.dart';
import 'package:smart_shipment_system/presentation/authenticathion/forgetPassword/view/forgetPasswordView.dart';
import 'package:smart_shipment_system/presentation/authenticathion/login/view/loginView.dart';
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
  static const String deliveryRegistrationView1Route =
      "/deliveryRegistration1View";
  static const String deliveryRegistrationView2Route =
      "/deliveryRegistration2View";
  // static const String deliveryRegistrationView3Route =
  //     "/deliveryRegistration3View";
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
          child: SplashScreenView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: Routes.onBoardingViewRoute,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(milliseconds: 1000),
          key: state.pageKey,
          child: OnBoardingView(),
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
          child: const AuthenticationView(),
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
          child: const DeliveryAuthView(),
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
          child: const ClientAuthView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: Routes.loginViewRoute,
        pageBuilder: (context, state) {
          initLoginModule();
          return CustomTransitionPage<void>(
            transitionDuration: const Duration(
                milliseconds: AppConstants.transitionDurationMillySeconds),
            key: state.pageKey,
            child: LoginView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        },
      ),
      GoRoute(
        path: Routes.clientRegistrationViewRoute,
        pageBuilder: (context, state) {
          initClientRegistrationModule();
          return CustomTransitionPage<void>(
            transitionDuration: const Duration(
                milliseconds: AppConstants.transitionDurationMillySeconds),
            key: state.pageKey,
            child: ClientRegistrationView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        },
      ),
      GoRoute(
        path: Routes.deliveryRegistrationView1Route,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return CustomTransitionPage<void>(
            transitionDuration: const Duration(
                milliseconds: AppConstants.transitionDurationMillySeconds),
            key: state.pageKey,
            child: DeliveryRegistrationView1(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(0.25, 0.25),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          );
        },
      ),
      GoRoute(
        path: Routes.deliveryRegistrationView2Route,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return CustomTransitionPage<void>(
            transitionDuration: const Duration(
                milliseconds: AppConstants.transitionDurationMillySeconds),
            key: state.pageKey,
            child: DeliveryRegistrationView2(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(0.25, 0.25),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          );
        },
      ),   GoRoute(
        path: Routes.deliveryRegistrationRoleViewRoute,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return CustomTransitionPage<void>(
            transitionDuration: const Duration(
                milliseconds: AppConstants.transitionDurationMillySeconds),
            key: state.pageKey,
            child: DeliveryRegistrationRoleView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(0.25, 0.25),
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeIn)),
                    ),
                    child: child),
          );
        },
      ),
      // GoRoute(
      //   path: Routes.deliveryRegistrationView3Route,
      //   pageBuilder: (context, state) {
      //     initDeliveryRegistrationModule();
      //     return CustomTransitionPage<void>(
      //       transitionDuration: const Duration(
      //           milliseconds: AppConstants.transitionDurationMillySeconds),
      //       key: state.pageKey,
      //       child: DeliveryRegistrationView1(),
      //       transitionsBuilder:
      //           (context, animation, secondaryAnimation, child) =>
      //               SlideTransition(
      //                   position: animation.drive(
      //                     Tween<Offset>(
      //                       begin: const Offset(0.25, 0.25),
      //                       end: Offset.zero,
      //                     ).chain(CurveTween(curve: Curves.easeIn)),
      //                   ),
      //                   child: child),
      //     );
      //   },
      // ),
      GoRoute(
        path: Routes.deliveryInteriorRegistrationViewRoute,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return CustomTransitionPage<void>(
            transitionDuration: const Duration(
                milliseconds: AppConstants.transitionDurationMillySeconds),
            key: state.pageKey,
            child: DeliveryInteriorRegistrationView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(0.25, 0.25),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          );
        },
      ),
      GoRoute(
        path: Routes.deliveryExternalRegistrationViewRoute,
        pageBuilder: (context, state) {
          initDeliveryRegistrationModule();
          return CustomTransitionPage<void>(
            transitionDuration: const Duration(
                milliseconds: AppConstants.transitionDurationMillySeconds),
            key: state.pageKey,
            child: DeliveryRegistrationView1(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(0.25, 0.25),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          );
        },
      ),
      GoRoute(
        path: Routes.forgotPasswordViewRoute,
        pageBuilder: (context, state) {
          initForgotPasswordModule();
          return CustomTransitionPage<void>(
            transitionDuration: const Duration(
                milliseconds: AppConstants.transitionDurationMillySeconds),
            key: state.pageKey,
            child: ForgotPasswordView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        },
      ),
      GoRoute(
        path: Routes.changePasswordViewRoute,
        pageBuilder: (context, state) {
          initChangePasswordModule();
          return CustomTransitionPage<void>(
            transitionDuration: const Duration(
                milliseconds: AppConstants.transitionDurationMillySeconds),
            key: state.pageKey,
            child: ChangePasswordView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        },
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
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
    ],
  );
}
