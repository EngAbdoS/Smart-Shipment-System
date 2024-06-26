import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

Widget notificationSwitch(Function fun, Stream<bool?> outputSwitchValue) {
  return StreamBuilder<bool?>(
      stream: outputSwitchValue,
      builder: (context, snapshot) {
        return Switch(
            activeColor: ColorManager.primary,
            inactiveTrackColor: ColorManager.primary.withOpacity(0.05),
            inactiveThumbColor: ColorManager.gray,
            value: snapshot.data ?? true,
            onChanged: (value) => fun(value));
      });
}
