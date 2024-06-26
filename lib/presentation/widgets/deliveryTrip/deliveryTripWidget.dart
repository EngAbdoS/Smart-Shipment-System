import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/domain/models/deliveryTripModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTrip/tripTextWidget.dart';

Widget deliveryTripWidget(BuildContext context, DeliveryTripModel deliveryTrip,
    int index, Function deleteTrip) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8 * 0.6, vertical: AppPadding.p8),
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: ColorManager.primary.withOpacity(0.1), blurRadius: 40)
      ], color: ColorManager.offWhite, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: tripTextWidget(
                      context,
                      (deliveryTrip.isOneTime ?? true)
                          ? "${AppStrings.tripDays.tr()}: ${deliveryTrip.tripDay}"
                          : "${AppStrings.tripDays.tr()}: ${deliveryTrip.tripWeekDays}")),
              IconButton(
                  onPressed: () => deleteTrip(context, index),
                  icon: const Icon(
                    Icons.delete,
                    color: ColorManager.primary,
                  ))
            ],
          ),
          tripTextWidget(
              context, "${AppStrings.tripTime.tr()}: ${deliveryTrip.tripTime}"),
          SizedBox(
            height: 14.sp,
          ),
          tripTextWidget(context,
              "${AppStrings.fromLocation.tr()}: ${deliveryTrip.fromAddressName}"),
          SizedBox(
            height: 14.sp,
          ),
          tripTextWidget(context,
              "${AppStrings.toLocation.tr()}: ${deliveryTrip.toAddressName}"),
          SizedBox(
            height: 14.sp,
          ),
          tripTextWidget(context,
              "${AppStrings.tripDetails.tr()}: ${deliveryTrip.tripDetails}"),
          SizedBox(
            height: 14.sp,
          ),
        ],
      ),
    ),
  );
}
