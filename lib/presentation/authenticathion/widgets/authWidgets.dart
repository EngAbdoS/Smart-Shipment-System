import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget nameInputWidget(Stream<bool> outputIsFirstNameValid, Function setName,
    TextEditingController nameTextEditingController) {
  return StreamBuilder<bool>(
      stream: outputIsFirstNameValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (firstName) => setName(firstName),
          //  _viewModel.setFirstName(firstName),
          keyboardType: TextInputType.name,
          controller: nameTextEditingController,
          //_firstNameController,
          decoration: InputDecoration(
            // label: Text(AppStrings.username.tr()),
            hintText: AppStrings.fNameHint.tr(),
            labelText: AppStrings.fName.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.fNameHint.tr(),
          ),
        );
      });
}
