import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget nameInputWidget(Stream<bool> outputIsFirstNameValid, Function setName,
    TextEditingController nameTextEditingController) {
  return StreamBuilder<bool>(
      stream: outputIsFirstNameValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (name) => setName(name),
          //  _viewModel.setFirstName(firstName),
          keyboardType: TextInputType.name,
          controller: nameTextEditingController,
          //_firstNameController,
          decoration: InputDecoration(
            // label: Text(AppStrings.username.tr()),
            hintText: AppStrings.nameHint.tr(),
            labelText: AppStrings.name.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.nameHint.tr(),
          ),
        );
      });
}
Widget nationalIdInputWidget(Stream<bool> outputIsNationalIdValid, Function setNationalID,
    TextEditingController nationalIdTextEditingController) {
  return StreamBuilder<bool>(
      stream: outputIsNationalIdValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (NID) => setNationalID(NID),
          keyboardType: TextInputType.number,
          controller: nationalIdTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.nationalIdHint.tr(),
            labelText: AppStrings.nationalId.tr(),
            errorText:
            (snapshot.data ?? true) ? null : AppStrings.nationalIdError.tr(),
          ),
        );
      });
}

Widget phoneNumberInputWidget(Stream<bool> outputIsPhoneNumberValid, Function setPhoneNumber,
    TextEditingController phoneNumberTextEditingController) {
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
            errorText:
            (snapshot.data ?? true) ? null : AppStrings.phoneNumberError.tr(),
          ),
        );
      });
}

