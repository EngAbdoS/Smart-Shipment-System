import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget nameInputWidget(
    Stream<bool> outputIsFirstNameValid,
    Function setName,
    ) {
  TextEditingController nameTextEditingController = TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsFirstNameValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (name) => setName(name),
          keyboardType: TextInputType.name,
          controller: nameTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.nameHint.tr(),
            labelText: AppStrings.name.tr(),
            errorText:
            (snapshot.data ?? true) ? null : AppStrings.nameHint.tr(),
          ),
        );
      });
}
