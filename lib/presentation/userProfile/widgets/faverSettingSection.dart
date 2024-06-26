import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/userProfile/viewModel/clientUserProfileViewModel.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/changeLanguage.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/faverSetting.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/generalSetting.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/logoutWidget.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/notificationSwitch.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/ratingWidget.dart';

Widget faverSettingSection(BuildContext context, bool isClientOrDelivery,
    UserProfileViewModel viewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(6),
        child: Text(
          AppStrings.faves,
          style: Theme.of(context).textTheme.headlineMedium,
        ).tr(),
      ),
      faverSetting(
          context,
          notificationSwitch(viewModel.changeNotificationSwitch,
              viewModel.outputNotificationSwitchStream),
          AppStrings.notifications,
          AppStrings.edit_notifications,
          Icons.notifications),
      faverSetting(context, changeLanguage(context, viewModel),
          AppStrings.language, AppStrings.choose_language, Icons.language),
      isClientOrDelivery
          ? generalSetting(context,() =>ratingWidget(context), AppStrings.rate,
              AppStrings.how_rate, Icons.star)
          : Container(),
      logoutWidget(context, viewModel),
    ],
  );
}
