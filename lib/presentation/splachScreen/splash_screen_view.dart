import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/use_cases/splash_navigation_use_case.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final SplashNavigationUseCase _splashNavigationUseCase =
      instance<SplashNavigationUseCase>();

  bool _moreThanThereSeconds = false;

  @override
  void initState() {
    _nextNavigation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _startTiming();
    return Scaffold(body: splashWidget());
  }

  _nextNavigation(BuildContext context) async {
    (await _splashNavigationUseCase.execute(context)).fold(
        (l) => _moreThanThereSeconds
            ? Navigator.of(context).pushReplacementNamed(Routes.noRoute)
            : Future.delayed(const Duration(seconds: 2),
                () => Navigator.of(context).pushReplacementNamed(Routes.noRoute)),
        (route) => _moreThanThereSeconds
            ? Navigator.of(context).pushReplacementNamed(route)
            : Future.delayed(const Duration(seconds: 2),
                () => Navigator.of(context).pushReplacementNamed(route)));
  }

  _startTiming() async {
    Future.delayed(
        const Duration(seconds: 3), () => _moreThanThereSeconds = true);
  }
}

Widget splashWidget() {
  return Container(
    height: double.maxFinite,
    width: double.maxFinite,
    alignment: Alignment.center,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        authLogoWidget(height: 200.h.toInt()),
        SizedBox(
          height: 30.h,
        ),
        ClipRect(
          child: Image.asset(
            ImageAssets.tripleS,
            width: 166.h,
          ),
        ).animate().fade(duration: 300.milliseconds),
      ],
    ),
  );
}
