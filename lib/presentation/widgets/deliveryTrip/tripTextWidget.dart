import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

Widget tripTextWidget(BuildContext context, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8, vertical: AppPadding.p8),
    decoration: BoxDecoration(
      border: Border.all(color: ColorManager.lightGray),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: Theme.of(context).textTheme.titleSmall,
    ),
  );
}
