import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget shipmentListStatusBar(BuildContext context, Function changeState,
    Stream<bool?> shipmentListStatus) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: StreamBuilder<bool?>(
        stream: shipmentListStatus,
        builder: (context, snapshot) {
          return Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                shipmentListStatusBarTap(context, AppStrings.done_operation,
                    (snapshot.data ?? true) == false, changeState, false),
                const SizedBox(
                  width: 4,
                ),
                shipmentListStatusBarTap(context, AppStrings.active_operation,
                    (snapshot.data ?? true) == true, changeState, true),
              ],
            ),
          );
        }),
  );
}

Widget shipmentListStatusBarTap(BuildContext context, String title,
    bool isActive, Function changeState, bool value) {
  return Flexible(
    child: GestureDetector(
      onTap: () => changeState(value),
      child: Container(
        height: 50.h,
        //width: double.infinity,
        decoration: BoxDecoration(
          color: isActive ? ColorManager.primary : ColorManager.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
        ),
      ),
    ),
  );
}
