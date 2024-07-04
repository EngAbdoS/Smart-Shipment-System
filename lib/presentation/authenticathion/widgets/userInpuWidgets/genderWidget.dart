import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

Widget genderWidget(
    BuildContext context, Stream<bool> outputGenderValid, Function setGender) {
  return StreamBuilder<bool>(
      stream: outputGenderValid,
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => setGender(true),
              child: Container(
                height: AppSize.s24,
                width: AppSize.s24,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: (snapshot.data ?? false)
                            ? ColorManager.primary
                            : ColorManager.gray),
                    shape: BoxShape.circle,
                    color: (snapshot.data ?? false)
                        ? ColorManager.primary
                        : ColorManager.noColor),
              ),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              AppStrings.male,
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
            const SizedBox(
              width: AppSize.s18 * 2,
            ),
            GestureDetector(
              onTap: () => setGender(false),
              child: Container(
                height: AppSize.s24,
                width: AppSize.s24,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: (snapshot.data ?? false)
                            ? ColorManager.primary
                            : ColorManager.gray),
                    shape: BoxShape.circle,
                    color: (snapshot.data ?? true)
                        ? ColorManager.noColor
                        : ColorManager.primary),
              ),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              AppStrings.female,
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
          ],
        );
      });
}
