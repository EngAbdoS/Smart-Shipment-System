import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

Widget authLogoWidget({int height = 122, bool isAnimate = true}) => Animate(
      effects: isAnimate
          ? [
              const ShakeEffect(curve: Curves.bounceInOut),
            ]
          : [],
      child: Container(
        padding: const EdgeInsets.only(
            top: AppPadding.p22 * 2, bottom: AppPadding.p18),
        child: SvgPicture.asset(
          SVGAssets.logoShadowSVG,
          height: height.sp,
        ),
      ),
    );
