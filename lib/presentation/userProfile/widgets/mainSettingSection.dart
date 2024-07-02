import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

Widget mainSettingSection(
    BuildContext context, UserModel user) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ProfileCirclerImage(
        imageUrl: user.profileImage,

      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.userName,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.black, fontSize: 17),
          ).tr(),
          Text(
            user.email,
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
        ],
      ),
    ],
  );
}
