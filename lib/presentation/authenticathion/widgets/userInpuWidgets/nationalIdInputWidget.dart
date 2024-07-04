import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget nationalIdInputWidget(
  Stream<bool> outputIsNationalIdValid,
  Function setNationalID,
) {
  TextEditingController nationalIdTextEditingController =
      TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsNationalIdValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (nationalId) => setNationalID(nationalId),
          keyboardType: TextInputType.number,
          controller: nationalIdTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.nationalIdHint.tr(),
            labelText: AppStrings.nationalId.tr(),
            errorText: (snapshot.data ?? true)
                ? null
                : AppStrings.nationalIdError.tr(),
          ),
        );
      });
}
