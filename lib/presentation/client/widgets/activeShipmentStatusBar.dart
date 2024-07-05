import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget activeShipmentStatusBar(
    {required BuildContext context,
    required ShipmentModel shipment,
    bool withDetails = false}) {
  shipment.status == AppConstants.activeShipmentStatusDelivered
      ? {
          shipment.pickedUp = true,
          shipment.coming = true,
          shipment.unPicked = true
        }
      : shipment.status == AppConstants.activeShipmentStatusComing
          ? {shipment.pickedUp = true, shipment.unPicked = true}
          : shipment.status == AppConstants.activeShipmentStatusPickedUp
              ? {shipment.unPicked = true}
              : null;

  return SizedBox(
    width: double.maxFinite,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 4,
        ),
        withDetails
            ? activeShipmentStatusBarSectionDetails(context)
            : Container(),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            activeShipmentStatusBarSection(
                isActive: shipment.unPicked, notFirst: false),
            activeShipmentStatusBarSection(isActive: shipment.pickedUp),
            activeShipmentStatusBarSection(isActive: shipment.coming),
            activeShipmentStatusBarSection(isActive: shipment.delivered),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        activeShipmentStatusBarSectionDetailsCountry(
            context, shipment.startLocation, shipment.endLocation),
      ],
    ),
  );
}

Widget activeShipmentStatusBarSectionDetailsCountry(
    BuildContext context, String startLocation, String endLocation) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        startLocation,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8),
      ),
      Text(
        endLocation,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8),
      ),
    ],
  );
}

Widget activeShipmentStatusBarSectionDetails(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        AppStrings.unPicked,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8),
      ).tr(),
      Text(
        AppStrings.pickedUp,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8),
      ).tr(),
      Text(
        AppStrings.coming,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8),
      ).tr(),
      Text(
        "             ${AppStrings.delivered.tr()} ",
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8),
      ),
    ],
  );
}

Widget activeShipmentStatusBarSection(
    {required bool isActive, bool notFirst = true}) {
  return notFirst
      ? Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  height: 6.sp,
                  thickness: 6,
                  color: isActive ? ColorManager.black : ColorManager.darkGray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  height: 15.h,
                  width: 15.h,
                  decoration: BoxDecoration(
                      color:
                          isActive ? ColorManager.black : ColorManager.darkGray,
                      shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            height: 15.h,
            width: 15.h,
            decoration: BoxDecoration(
                color: isActive ? ColorManager.black : ColorManager.darkGray,
                shape: BoxShape.circle),
          ),
        );
}
