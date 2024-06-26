import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/userProfile/viewModel/userProfileViewModel.dart';

Widget languageWidget(BuildContext context, bool isLang, String lang,
    UserProfileViewModel viewModel) {
  return GestureDetector(
    onTap: () => isLang ? {} : viewModel.changeLanguage(context),
    child: Container(
      width: 60.w,
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isLang ? ColorManager.primary : ColorManager.white,
        border: Border.all(color: ColorManager.primary),
      ),
      child: Center(
        child: Text(
          lang,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: isLang ? ColorManager.black : ColorManager.primary),
        ).tr(),
      ),
    ),
  );
}
