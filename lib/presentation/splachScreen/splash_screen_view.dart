import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/use_cases/splash_navigation_use_case.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});

  final SplashNavigationUseCase _splashNavigationUseCase =
      instance<SplashNavigationUseCase>();
  bool moreThanThereSeconds = false;

  @override
  Widget build(BuildContext context) {
    startTiming();
    return Scaffold(
      body: AnimatedSplashScreen.withScreenFunction(
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        splash: const SplashWidget(),
        splashIconSize: 300,
        duration: 50000,
        backgroundColor: ColorManager.offWhite,
        screenFunction: () async {
          nextNavigation(context);
          return Container(
            color: Colors.black12,
            child: const Text("a7a"),
          );
        },
      ),
    );
  }

  nextNavigation(BuildContext context) async {
    (await _splashNavigationUseCase.execute(context)).fold(
        (l) => moreThanThereSeconds
            ? GoRouter.of(context).pushReplacement(Routes.noRoute)
            : Future.delayed(const Duration(seconds: 2),
                () => GoRouter.of(context).pushReplacement(Routes.noRoute)),
        (route) => moreThanThereSeconds
            ? GoRouter.of(context).pushReplacement(route)
            : Future.delayed(const Duration(seconds: 2   ),
                () => GoRouter.of(context).pushReplacement(route)));
  }

  startTiming() async {
    Future.delayed(
        const Duration(seconds: 3), () => moreThanThereSeconds = true);
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRect(
            child: SvgPicture.asset(
                height: AppSize.s100 * 6,
              //  width: AppSize.s100 * 1.66,
                SVGAssets.logoSVG),
          ),
        ),
        const SizedBox(
          height: AppSize.s20*1.5,
        ),
        Expanded(
          child: ClipRect(
            child:
             Image.asset(ImageAssets.tripleS
             ,width: AppSize.s100 * 1.66,
             ),
            // SvgPicture.asset(
            //   excludeFromSemantics: true,
            //     height: AppSize.s100 * 3,
            //     width: AppSize.s100 * 1.66,
            //     SVGAssets.tripleS),
          ),
        ),
        // Text(
        //   AppStrings.tripleS,
        //   style: Theme.of(context).textTheme.headlineLarge,
        // ).tr(),
        // const SizedBox(
        //   height: AppSize.s18,
        // ),
        // Text(
        //   AppStrings.smartShipmentSystem,
        //   style: Theme.of(context).textTheme.headlineLarge,
        // ).tr()
      ],
    );
  }
}
