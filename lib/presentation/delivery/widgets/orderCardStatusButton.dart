import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

Widget orderCardStatusButton(BuildContext context, String status,
    String orderId, Function changeStatus) {
  String nextStatus = status == AppConstants.activeShipmentStatusUnPicked
      ? AppConstants.activeShipmentStatusPickedUp
      : status == AppConstants.activeShipmentStatusPickedUp
          ? AppConstants.activeShipmentStatusComing
          : status == AppConstants.activeShipmentStatusComing
              ? AppConstants.activeShipmentStatusDelivered
              : "noState";

  return RegularButton(
    buttonAction: nextStatus!= "noState"?() => changeStatus(context, orderId, nextStatus):(){},
    buttonWidget: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          nextStatus != "noState"
              ? Text(
                  nextStatus,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorManager.black), textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            softWrap: true,
                ).tr()
              : Container(),
          nextStatus != "noState"
              ? SizedBox(
                  width: 10.w,
                )
              : Container(),
          nextStatus != "noState"
              ? const Icon(Icons.inventory_sharp)
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.done_outline_outlined,
                    size: 30,
                    color: ColorManager.darkGreen,
                  ),
                ),
        ],
      ),
    ),
  );
}
