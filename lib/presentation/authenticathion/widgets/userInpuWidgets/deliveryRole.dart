import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import '../../../../app/app_constants.dart';
import '../../../resources/color_manager.dart';

Widget deliveryRole(BuildContext context, Function setRole) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        AppStrings.deliveryRole,
        style: Theme.of(context).textTheme.titleMedium,
      ).tr().animate(delay: 300.milliseconds).fade(
          duration: 300.milliseconds, curve: Curves.fastEaseInToSlowEaseOut),
      SizedBox(
        height: 80.sp,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setRole(context, AppConstants.deliveryRoleInternal),
            child: Container(
              height: 110.sp,
              width: 150.sp,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                    color: ColorManager.shadowColor.withOpacity(0.25),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  AppStrings.deliveryInternal,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
            ),
          ).animate().slideX(begin: 0.5, end: 0.0, curve: Curves.easeInOutBack),
          GestureDetector(
            onTap: () => setRole(context, AppConstants.deliveryRoleExternal),
            child: Container(
              height: 110.sp,
              width: 150.sp,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                    color: ColorManager.shadowColor.withOpacity(0.25),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  AppStrings.deliveryExternal,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
            ),
          )
              .animate()
              .slideX(begin: -0.5, end: 0.0, curve: Curves.easeInOutBack),
        ],
      ),
      SizedBox(
        height: 80.sp,
      ),
      Text(
        AppStrings.deliveryInternalDescription,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.error.withOpacity(0.5), fontSize: 12),
      ).tr(),
      SizedBox(
        height: 10.sp,
      ),
      Text(
        AppStrings.deliveryExternalDescription,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.error.withOpacity(0.5), fontSize: 12),
      ).tr().animate(delay: 300.milliseconds).fade(
          duration: 300.milliseconds, curve: Curves.fastEaseInToSlowEaseOut),
    ],
  );
}
