import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget addressInputWidget(
  Stream<bool> outputIsAddressValid,
  Function setAddress,
) {
  TextEditingController addressTextEditingController = TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsAddressValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (address) => setAddress(address),
          keyboardType: TextInputType.streetAddress,
          controller: addressTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.addressHint.tr(),
            labelText: AppStrings.address.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.addressHint.tr(),
          ),
        );
      });
}
