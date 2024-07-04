import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget phoneNumberInputWidget(
  Stream<bool> outputIsPhoneNumberValid,
  Function setPhoneNumber,
) {
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsPhoneNumberValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (phoneNumber) => setPhoneNumber(phoneNumber),
          keyboardType: TextInputType.phone,
          controller: phoneNumberTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.phoneNumberHint.tr(),
            labelText: AppStrings.phoneNumber.tr(),
            errorText: (snapshot.data ?? true)
                ? null
                : AppStrings.phoneNumberError.tr(),
          ),
        );
      });
}
