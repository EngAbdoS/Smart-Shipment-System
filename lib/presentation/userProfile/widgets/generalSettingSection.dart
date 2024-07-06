import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/userProfile/viewModel/userProfileViewModel.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/generalSetting.dart';

Widget generalSettingSection(BuildContext context, bool isClientOrDelivery,
    UserProfileViewModel viewModel, dynamic mainViewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(6),
        child: Text(
          AppStrings.general,
          style: Theme.of(context).textTheme.headlineMedium,
        ).tr(),
      ),
      !isClientOrDelivery
          ? generalSetting(
              context,
            () => mainViewModel.changeWidget(context, 7),
              AppStrings.active_history,
              AppStrings.active_history_hint,
              Icons.history_edu,
            )
          : Container(),
      viewModel.userProfileData.role == AppConstants.deliveryRoleExternal
          ? generalSetting(
              context,
              () => mainViewModel.changeWidget(context, 6),
              AppStrings.trips,
              AppStrings.edit_trip_list,
              Icons.transfer_within_a_station_outlined,
            )
          : Container(),
      !isClientOrDelivery
          ? generalSetting(
              context,
              () {},
              AppStrings.my_rating,
              AppStrings.my_rating_hint,
              Icons.star_rate_rounded,
            )
          : Container(),
      generalSetting(
        context,
        () => mainViewModel.changeWidget(context, 5),
        AppStrings.edit_profile,
        AppStrings.profile_edits,
        Icons.edit,
      ),
      generalSetting(
        context,
        () => viewModel.forgotPassword(context),
        AppStrings.changePassword,
        AppStrings.profile_safety,
        Icons.lock,
      ),
      isClientOrDelivery
          ? generalSetting(
              context,
              () {},
              AppStrings.my_locations,
              AppStrings.profile_safety,
              Icons.location_on,
            )
          : Container(),

    ],
  );
}
