import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/userProfile/viewModel/clientUserProfileViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

Widget mainSettingSection(
    BuildContext context, UserProfileViewModel viewModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ProfileCirclerImage(
        imageUrl: viewModel.userProfileData.profileImage,
        navigate: () {},
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            viewModel.userProfileData.userName,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.black, fontSize: 17),
          ).tr(),
          Text(
            viewModel.userProfileData.email,
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
        ],
      ),
    ],
  );
}
