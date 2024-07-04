import 'package:flutter/material.dart';
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
import 'package:smart_shipment_system/presentation/client/main/view/mainClientView.dart';
import 'package:smart_shipment_system/presentation/delivery/main/view/mainDeliveryView.dart';
import 'package:smart_shipment_system/presentation/onboarding/view/onBoardingView.dart';
import 'package:smart_shipment_system/presentation/resources/page_transition_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/splachScreen/splash_screen_view.dart';
import 'package:smart_shipment_system/presentation/widgets/noNetworkView.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String noRoute = "/noRoute";
  static const String noNetworkView = "/noNetworkView";
  static const String mainClientViewRoute = "/mainClientView";
  static const String mainDeliveryViewRoute = "/mainDeliveryView";
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

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashRoute:
      return customPageRoute(
          const SplashScreenView(), settings, fadeTransition);
      break;
    case Routes.mainClientViewRoute:
      initMainClientModule();
      return customPageRoute(const MainClientView(), settings, fadeTransition);
      break;
    case Routes.mainDeliveryViewRoute:
      initMainDeliveryModule();
      return customPageRoute(
          const MainDeliveryView(), settings, fadeTransition);
      break;
    case Routes.onBoardingViewRoute:
      return customPageRoute(OnBoardingView(), settings, fadeTransition);
      break;
    case Routes.authViewRoute:
      return customPageRoute(
          const AuthenticationView(), settings, fadeTransition);
      break;
    case Routes.deliveryAuthViewRoute:
      return customPageRoute(
          const DeliveryAuthView(), settings, fadeTransition);
      break;
    case Routes.clientAuthViewRoute:
      return customPageRoute(const ClientAuthView(), settings, fadeTransition);
      break;
    case Routes.loginViewRoute:
      initLoginModule();
      return customPageRoute(LoginView(), settings, fadeTransition);
      break;
    case Routes.clientRegistrationViewRoute:
      initClientRegistrationModule();
      return customPageRoute(
          ClientRegistrationView(), settings, slideTransitionFromLeft);
      break;
    case Routes.deliveryRegistrationView1Route:
      initDeliveryRegistrationModule();
      return customPageRoute(
          DeliveryRegistrationView1(), settings, slideTransitionFromRight);
      break;
    case Routes.deliveryRegistrationView2Route:
      initDeliveryRegistrationModule();
      return customPageRoute(
          DeliveryRegistrationView2(), settings, slideTransitionFromRight);
      break;
    case Routes.deliveryRegistrationRoleViewRoute:
      initDeliveryRegistrationModule();
      return customPageRoute(
          DeliveryRegistrationRoleView(), settings, slideTransitionFromRight);
      break;
    case Routes.deliveryInteriorRegistrationViewRoute:
      initDeliveryRegistrationModule();
      return customPageRoute(DeliveryInteriorRegistrationView(), settings,
          slideTransitionFromRight);
      break;
    case Routes.deliveryExternalRegistrationViewRoute:
      initDeliveryRegistrationModule();
      return customPageRoute(DeliveryExternalRegistrationView(), settings,
          slideTransitionFromRight);
      break;
    case Routes.forgotPasswordViewRoute:
      initForgotPasswordModule();
      return customPageRoute(ForgotPasswordView(), settings, fadeTransition);
      break;
    case Routes.changePasswordViewRoute:
      return customPageRoute(ChangePasswordView(), settings, fadeTransition);
      break;
    case Routes.emilVerificationViewRoute:
      return customPageRoute(EmailVerificationView(), settings, fadeTransition);
      break;
    case Routes.noNetworkView:
      return customPageRoute(NoNetworkView(), settings, fadeTransition);
      break;
    case Routes.noRoute:
      print("no route");
      return customPageRoute(
        Scaffold(
          appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
          body: const Center(child: Text(AppStrings.noRouteFound)),
        ),
        settings,
        fadeTransition,
      );
      break;
    default:
      print("no route default");

      return customPageRoute(
        Scaffold(
          //appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
          body: Container(),
        ),
        settings,
        fadeTransition,
      );
  }
}

// abstract class AppRouter {
//   static final router = GoRouter(
//       routes: [
//         GoRoute(
//           path: Routes.splashRoute,
//           pageBuilder: (context, state) => customPageTransition(
//               state.pageKey, const SplashScreenView(), fadeTransitionGlobal),
//         ),
//         GoRoute(
//           path: Routes.mainClientViewRoute,
//           pageBuilder: (context, state) {
//             initMainClientModule();
//             return customPageTransition(
//                 state.pageKey, const MainClientView(), fadeTransitionGlobal);
//           },
//         ),
//         GoRoute(
//           path: Routes.mainDeliveryViewRoute,
//           pageBuilder: (context, state) {
//             initMainDeliveryModule();
//             return customPageTransition(
//                 state.pageKey, const MainDeliveryView(), fadeTransitionGlobal);
//           },
//         ),
//         GoRoute(
//           path: Routes.onBoardingViewRoute,
//           pageBuilder: (context, state) => customPageTransition(
//               state.pageKey, OnBoardingView(), fadeTransitionGlobal),
//         ),
//         GoRoute(
//           path: Routes.authViewRoute,
//           pageBuilder: (context, state) => customPageTransition(
//               state.pageKey, const AuthenticationView(), fadeTransitionGlobal),
//         ),
//         GoRoute(
//           path: Routes.deliveryAuthViewRoute,
//           pageBuilder: (context, state) => customPageTransition(
//               state.pageKey, const DeliveryAuthView(), fadeTransitionGlobal),
//         ),
//         GoRoute(
//           path: Routes.clientAuthViewRoute,
//           pageBuilder: (context, state) => customPageTransition(
//               state.pageKey, const ClientAuthView(), fadeTransitionGlobal),
//         ),
//         GoRoute(
//           path: Routes.loginViewRoute,
//           pageBuilder: (context, state) {
//             initLoginModule();
//             return customPageTransition(
//                 state.pageKey, LoginView(), fadeTransitionGlobal);
//           },
//         ),
//         GoRoute(
//           path: Routes.clientRegistrationViewRoute,
//           pageBuilder: (context, state) {
//             initClientRegistrationModule();
//             return customPageTransition(
//                 state.pageKey, ClientRegistrationView(), slideTransitionLeft);
//           },
//         ),
//         GoRoute(
//           path: Routes.deliveryRegistrationView1Route,
//           pageBuilder: (context, state) {
//             initDeliveryRegistrationModule();
//             return customPageTransition(state.pageKey,
//                 DeliveryRegistrationView1(), slideTransitionForRegistration);
//           },
//         ),
//         GoRoute(
//           path: Routes.deliveryRegistrationView2Route,
//           pageBuilder: (context, state) {
//             initDeliveryRegistrationModule();
//             return customPageTransition(state.pageKey,
//                 DeliveryRegistrationView2(), slideTransitionForRegistration);
//           },
//         ),
//         GoRoute(
//           path: Routes.deliveryRegistrationRoleViewRoute,
//           pageBuilder: (context, state) {
//             initDeliveryRegistrationModule();
//             return customPageTransition(state.pageKey,
//                 DeliveryRegistrationRoleView(), slideTransitionForRegistration);
//           },
//         ),
//         GoRoute(
//           path: Routes.deliveryInteriorRegistrationViewRoute,
//           pageBuilder: (context, state) {
//             initDeliveryRegistrationModule();
//             return customPageTransition(
//                 state.pageKey,
//                 DeliveryInteriorRegistrationView(),
//                 slideTransitionForRegistration);
//           },
//         ),
//         GoRoute(
//           path: Routes.deliveryExternalRegistrationViewRoute,
//           pageBuilder: (context, state) {
//             initDeliveryRegistrationModule();
//             return customPageTransition(
//                 state.pageKey,
//                 DeliveryExternalRegistrationView(),
//                 slideTransitionForRegistration);
//           },
//         ),
//         GoRoute(
//           path: Routes.forgotPasswordViewRoute,
//           pageBuilder: (context, state) {
//             initForgotPasswordModule();
//             return customPageTransition(
//                 state.pageKey, ForgotPasswordView(), fadeTransitionGlobal);
//           },
//         ),
//         GoRoute(
//           path: Routes.changePasswordViewRoute,
//           pageBuilder: (context, state) {
//             return customPageTransition(
//                 state.pageKey, ChangePasswordView(), fadeTransitionGlobal);
//           },
//         ),
//         GoRoute(
//           path: Routes.emilVerificationViewRoute,
//           pageBuilder: (context, state) {
//             return customPageTransition(
//                 state.pageKey, EmailVerificationView(), fadeTransitionGlobal);
//           },
//         ),
//         GoRoute(
//           path: Routes.noNetworkView,
//           pageBuilder: (context, state) {
//             return customPageTransition(
//                 state.pageKey, NoNetworkView(), fadeTransitionGlobal);
//           },
//         ),
//         GoRoute(
//           path: Routes.noRoute,
//           pageBuilder: (context, state) => CustomTransitionPage<void>(
//             transitionDuration: const Duration(
//                 milliseconds: AppConstants.transitionDurationMillySeconds),
//             key: state.pageKey,
//             child: Scaffold(
//               appBar: AppBar(
//                 title: const Text(AppStrings.noRouteFound),
//               ),
//               body: const Center(
//                 child: Text(AppStrings.noRouteFound),
//               ),
//             ),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) =>
//                     FadeTransition(opacity: animation, child: child),
//           ),
//         ),
//       ],
//       errorBuilder: (context, state) => Scaffold(
//             appBar: AppBar(
//               title: const Text(AppStrings.noRouteFound),
//             ),
//             body: const Center(
//               child: Text(AppStrings.noRouteFound),
//             ),
//           ));
// }
