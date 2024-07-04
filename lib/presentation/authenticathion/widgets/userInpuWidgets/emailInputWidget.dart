import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget emailInputWidget(
  Stream<bool> outputIsEmailValid,
  Function setEmail,
) {
  TextEditingController emailTextEditingController = TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsEmailValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (email) => setEmail(email),
          keyboardType: TextInputType.emailAddress,
          controller: emailTextEditingController,
          //_firstNameController,
          decoration: InputDecoration(
            // label: Text(AppStrings.username.tr()),
            hintText: AppStrings.emailHint.tr(),
            labelText: AppStrings.emailHint.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.invalidEmail.tr(),
          ),
        );
      });
}
