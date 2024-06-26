import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

Widget settingSection(Widget section) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: section,
    ),
  );
}
