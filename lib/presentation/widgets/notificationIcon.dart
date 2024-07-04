import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';

Widget notificationIcon(GestureTapCallback iconNavigate) {
  return IconButton(
    onPressed: iconNavigate,
    icon: Lottie.asset(JsonAssets.notification,
        height: 80.h, fit: BoxFit.fitHeight),

    // Icon(
    //   Icons.notifications_none_rounded,
    //   size: 53.h,
    //   color: ColorManager.black,
    // ),
  ).animate().fade(duration: 300.milliseconds, curve: Curves.bounceInOut);
}
