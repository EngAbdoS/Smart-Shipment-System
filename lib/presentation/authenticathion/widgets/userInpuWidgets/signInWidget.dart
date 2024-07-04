import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget signInWidget(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.haveAcc,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorManager.black),
        ).tr(),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(Routes.loginViewRoute),
          child: Text(
            AppStrings.signIn,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorManager.black,
                  decoration: TextDecoration.underline,
                ),
          ).tr(),
        )
      ],
    ),
  );
}
