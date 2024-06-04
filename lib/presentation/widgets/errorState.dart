import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

errorState(
    {required BuildContext context,
      String lottieAssetPass = JsonAssets.error,
      String message = ""}) {
  context.loaderOverlay.visible?context.loaderOverlay.hide():null;
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
                  child: Lottie.asset(lottieAssetPass,
                      fit: BoxFit.cover, alignment: Alignment.center,height: 300),
                ).slideX(begin: 1, end: 0.0, curve: Curves.fastEaseInToSlowEaseOut),
                Text(message),
                Center(
                  child: GestureDetector(
                    onTap: () => context.loaderOverlay.hide(),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                  ),
                )



              ],
            )),

        // Center(
        //   child: GestureDetector(
        //     onTap: () => context.loaderOverlay.hide(),
        //     child: Container(
        //       height: 50,
        //       width: 50,
        //       color: Colors.red,
        //
        //     ),
        //   ),
        // )
      ],
    );
  });
}
