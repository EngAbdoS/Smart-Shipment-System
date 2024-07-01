import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/notificationIcon.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

Widget notificationsSliverAppBar({
  required BuildContext context,
  required UserModel user,
  required GestureTapCallback profileNavigate,
}) {
  return SliverAppBar(
    pinned: true,
    expandedHeight: 90.w,
    collapsedHeight: 90.h,
    stretch: true,
    snap: true,
    floating: true,
    leadingWidth: 0,
    leading: Container(),
    shape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(80),
        bottomRight: Radius.circular(80),
      ),
    ),
    backgroundColor: ColorManager.primary,
    title: Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileCirclerImage(
            imageUrl: user.profileImage,
            navigate: profileNavigate,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.goodMorning,
                  style: Theme.of(context).textTheme.titleSmall,
                ).tr(),
                Flexible(
                  child: Text(
                    user.userName,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: ColorManager.black, fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ).tr(),
                ),
              ],
            ),
          ),
          notificationIcon(() {}),
        ],
      ),
    ),
    toolbarHeight: 90.h,
    flexibleSpace: const FlexibleSpaceBar(
      stretchModes: <StretchMode>[
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
    ),
  );
}
