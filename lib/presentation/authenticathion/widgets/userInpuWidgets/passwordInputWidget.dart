import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget passwordInputWidget(
    Stream<bool> outputIsPasswordHidden,
    Function setPassword,
    Function validateConfirmPassword,
    Function changePasswordState,
    Stream<bool> outputIsPasswordValid) {
  TextEditingController passwordTextEditing = TextEditingController();

  return StreamBuilder<bool>(
    builder: (context, snapshot) {
      return StreamBuilder<bool>(
          stream: outputIsPasswordHidden,
          builder: (context, hiddenState) {
            return TextFormField(
              onChanged: (password) => {
                setPassword(password),
                validateConfirmPassword(),
              },
              obscureText: hiddenState.data ?? true,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordTextEditing,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      changePasswordState();
                    },
                    icon: Icon(
                      (hiddenState.data ?? true)
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      color: ColorManager.primary,
                    ),
                  ),
                  hintText: AppStrings.password.tr(),
                  labelText: AppStrings.password.tr(),
                  errorText: (snapshot.data ?? true)
                      ? null
                      : AppStrings.passwordInvalid.tr(),
                  errorMaxLines: 2),
            );
          });
    },
    stream: outputIsPasswordValid,
  );
}
