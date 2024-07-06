import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget shipmentStatusWidget(BuildContext context,String status)
{

  return Container(
    height: 50.h,
    width: 100.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      color: ColorManager.primary,
      boxShadow: [
        BoxShadow(
          color: ColorManager.black.withOpacity(0.15),
          blurRadius: 25,
          offset: const Offset(2, 8),
        ),
      ],
    ),
    alignment: Alignment.center,
    child: Center(
      child: Text(
        status == AppConstants.activeShipmentStatusUnPicked
            ? AppStrings.unPicked
            : status ==
            AppConstants.activeShipmentStatusPickedUp
            ? AppStrings.pickedUp
            : status ==
            AppConstants.activeShipmentStatusComing
            ? AppStrings.coming
            : status ==
            AppConstants.activeShipmentStatusDelivered
            ? AppStrings.delivered
            : "",
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontSize: 12),
        textAlign: TextAlign.center,
        overflow: TextOverflow.fade,
        softWrap: true,
      ).tr(),
    ),
  );


}