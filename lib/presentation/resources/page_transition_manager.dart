
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/app_constants.dart';

CustomTransitionPage customPageTransition(
    LocalKey? pageKey,
    Widget pageView,
    Widget Function(Animation<double> animation, Widget child)
    animatedTransition) {
  return CustomTransitionPage<void>(
    transitionDuration: const Duration(
        milliseconds: AppConstants.transitionDurationMillySeconds),
    key: pageKey,
    child: pageView,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        animatedTransition(animation, child),
  );
}

SlideTransition slideTransitionForRegistration(
    Animation animation, Widget child) {
  return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.bounceInOut)),
      ),
      child: child);
}
SlideTransition slideTransitionLeft(
    Animation animation, Widget child) {
  return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(-1, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.bounceInOut)),
      ),
      child: child);
}
FadeTransition fadeTransitionGlobal(Animation<double> animation, Widget child) {
  return FadeTransition(opacity: animation, child: child);
}
