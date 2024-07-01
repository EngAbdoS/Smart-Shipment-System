import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget priceWidget(BuildContext context, String? price) {
  return Container(
    height: 60.h,
    width: double.maxFinite,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      color: ColorManager.primary,
      boxShadow: const [
        BoxShadow(
          color: ColorManager.shadowColor,
          offset: Offset(2, 8),
          blurRadius: 16,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("${AppStrings.cost.tr()} :   ",
                style: Theme.of(context).textTheme.bodyLarge)
            ,
        Text(price ?? "!!!", style: Theme.of(context).textTheme.titleSmall)
            ,
      ],
    ),
  );
}
