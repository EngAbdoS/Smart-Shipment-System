import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

Widget robotWidget(BuildContext context) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      width: double.maxFinite,
      height: 200.h,
      decoration: BoxDecoration(
        color: ColorManager.offWhite,
        boxShadow: const [
          BoxShadow(
            color: ColorManager.offWhite,
            spreadRadius: 30,
            blurRadius: 10,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Animate(
          //delay: 100.microseconds,

            effects: [
              ShakeEffect(duration:900.milliseconds, curve: Curves.fastEaseInToSlowEaseOut)
            ],

            child: Lottie.asset(JsonAssets.robot)),
      ),
    ),
  );
}
