import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
errorState(
    {required BuildContext context,
    String lottieAssetPath = JsonAssets.error404,
    String message = "",GestureTapCallback buttonAction=noFun}) {
  context.loaderOverlay.visible ? context.loaderOverlay.hide() : null;
  context.loaderOverlay.show(widgetBuilder: (p) {
    return Stack(
      children: [
        Opacity(
          opacity: .1,
          child: Container(
            color: ColorManager.primary.withOpacity(0.5),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Animate(
                child: Lottie.asset(lottieAssetPath,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: 300),
              ).slideX(
                  begin: 1, end: 0.0, curve: Curves.fastEaseInToSlowEaseOut),
              Text(message).tr(),
              ElevatedButton(
                  onPressed:buttonAction==noFun?() => context.loaderOverlay.hide():buttonAction,
                  child: const Text(AppStrings.retryAgain).tr()),
            ],
          ),
        ),
      ],
    );
  });
}
