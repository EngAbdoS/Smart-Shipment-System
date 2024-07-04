import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget vehicleInputWidget(
  Stream<bool> outputIsVehicleValid,
  Function setVehicle,
) {
  TextEditingController vehicleTextEditingController = TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsVehicleValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (vehicle) => setVehicle(vehicle),
          keyboardType: TextInputType.text,
          controller: vehicleTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.vehicleHint.tr(),
            labelText: AppStrings.vehicleType.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.vehicleError.tr(),
          ),
        );
      });
}
