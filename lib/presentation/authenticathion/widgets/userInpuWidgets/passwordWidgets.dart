import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/userInpuWidgets/confirmPasswordInputWidget.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/userInpuWidgets/passwordInputWidget.dart';

Widget passwordWidgets(
    Stream<bool> outputIsPasswordValid,
    Stream<bool> outputIsConfirmPasswordValid,
    Stream<bool> outputIsPasswordHidden,
    Stream<bool> outputIsConfirmPasswordHidden,
    Function setPassword,
    Function setConfirmPassword,
    Function validateConfirmPassword,
    Function changePasswordState,
    Function changeConfirmPasswordState) {
  return Column(
    children: [
      passwordInputWidget(outputIsPasswordHidden, setPassword,
          validateConfirmPassword, changePasswordState, outputIsPasswordValid),
      SizedBox(
        height: 15.sp,
      ),
      confirmPasswordInputWidget(
          outputIsConfirmPasswordHidden,
          setConfirmPassword,
          changeConfirmPasswordState,
          outputIsConfirmPasswordValid),
    ],
  );
}
