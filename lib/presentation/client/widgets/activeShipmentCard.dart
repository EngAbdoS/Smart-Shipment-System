import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/activeShipmentStatusBar.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentCardId.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget activeShipmentCard(BuildContext context, ShipmentModel shipment) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray.withOpacity(0.15),
            blurRadius: 25,
            offset: const Offset(2, 8),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(shipment.date,
                  style: Theme.of(context).textTheme.titleSmall),
              Container(
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
                child: Text(
                  shipment.status == AppConstants.activeShipmentStatusUnPicked
                      ? AppStrings.unPicked
                      : shipment.status ==
                              AppConstants.activeShipmentStatusPickedUp
                          ? AppStrings.pickedUp
                          : shipment.status ==
                                  AppConstants.activeShipmentStatusComing
                              ? AppStrings.coming
                              : shipment.status ==
                                      AppConstants.activeShipmentStatusDelivered
                                  ? AppStrings.delivered
                                  : "",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 12),
                ).tr(),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          shipmentCardId(context, shipment.id),
          const SizedBox(
            height: 4,
          ),
          activeShipmentStatusBar(context: context, shipment: shipment),
        ],
      ),
    ),
  );
}
