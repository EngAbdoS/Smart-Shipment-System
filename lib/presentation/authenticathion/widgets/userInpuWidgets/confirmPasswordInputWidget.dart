import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

StreamBuilder<bool> confirmPasswordInputWidget(
    Stream<bool> outputIsConfirmPasswordHidden,
    Function setConfirmPassword,
    Function changeConfirmPasswordState,
    Stream<bool> outputIsConfirmPasswordValid) {
  TextEditingController confirmPasswordTextEditing = TextEditingController();

  return StreamBuilder<bool>(
    builder: (context, snapshot) {
      return StreamBuilder<bool>(
          stream: outputIsConfirmPasswordHidden,
          builder: (context, hiddenState) {
            return TextFormField(
              onChanged: (confirmPassword) =>
                  setConfirmPassword(confirmPassword),
              obscureText: hiddenState.data ?? true,
              keyboardType: TextInputType.visiblePassword,
              controller: confirmPasswordTextEditing,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      changeConfirmPasswordState();
                    },
                    icon: Icon(
                      (hiddenState.data ?? true)
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      color: ColorManager.primary,
                    ),
                  ),
                  hintText: AppStrings.confirmPass.tr(),
                  labelText: AppStrings.confirmPass.tr(),
                  errorText: (snapshot.data ?? true)
                      ? null
                      : AppStrings.confirmPassError.tr(),
                  errorMaxLines: 2),
            );
          });
    },
    stream: outputIsConfirmPasswordValid,
  );
}
