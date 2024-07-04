import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

Widget roleButton(String asset, GestureTapCallback roleRoute,
    BuildContext context, String role) {
  return GestureDetector(
    onTap: roleRoute,
    child: Column(
      children: [
        Container(
            width: AppSize.s100 * 1.25,
            height: AppSize.s100 * 1.25,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: ColorManager.offWhite),
            child: CircleAvatar(
              child: Image.asset(
                asset,
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(
          height: AppSize.s12 * 2,
        ),
        Text(
          role,
          style: Theme.of(context).textTheme.titleMedium,
        ).tr(),
      ],
    ),
  );
}
