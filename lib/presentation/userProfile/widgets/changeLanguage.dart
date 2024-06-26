import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/language_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/userProfile/viewModel/clientUserProfileViewModel.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/languageWidget.dart';

Widget changeLanguage(BuildContext context, UserProfileViewModel viewModel) {
  bool isArabic = context.locale == ARABIC_LOCAL ? true : false;
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      languageWidget(context, isArabic, AppStrings.arabic, viewModel),
      SizedBox(
        width: 5.w,
      ),
      languageWidget(context, !isArabic, AppStrings.english, viewModel),
    ],
  );
}
