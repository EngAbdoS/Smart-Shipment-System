import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/notificationIcon.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

Widget buildDeliverySliverAppBar(
    {required BuildContext context,
    required dynamic viewModel,
    required MainDeliveryViewModel mainDeliveryViewModel,
    bool isHomeOrHistory = true}) {
  return SliverAppBar(
    pinned: true,
    expandedHeight: 120.w,
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
            imageUrl: viewModel.userHomeData.profileImage,
            navigate: () => mainDeliveryViewModel.changeWidget(context, 3),
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
                    viewModel.userHomeData.userName,
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
          notificationIcon(
              () => mainDeliveryViewModel.changeWidget(context, 8)),
        ],
      ),
    ),
    toolbarHeight: 90.h,
    flexibleSpace: FlexibleSpaceBar(
      background: !isHomeOrHistory
          ? Container(
              padding: EdgeInsets.only(bottom: 20.h),
              alignment: Alignment.bottomCenter,
              child: Text(
                AppStrings.active_history,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16),
              ).tr(),
            )
          : Container(),
      stretchModes: const <StretchMode>[
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
    ),
  );
}
