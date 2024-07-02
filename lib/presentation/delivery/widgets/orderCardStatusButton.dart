import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    buttonAction: () => changeStatus(context, orderId, nextStatus),
    buttonWidget: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '${nextStatus.tr()} ! ',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.black),
      ),
    ),
  );
}
