import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentListStatusBar.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentSearch.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/notificationIcon.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

SliverAppBar buildSliverAppBar(
    {required BuildContext context,
    required ClientHomeViewModel clientViewModel,
    required MainClientViewModel mainClientViewModel,
    bool isHome = true}) {
  return SliverAppBar(
    pinned: false,
    expandedHeight: isHome ? 491.w : 300.w,
    collapsedHeight: 110.h,
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
            imageUrl: clientViewModel.userHomeData.profileImage,
            navigate: () => mainClientViewModel.changeWidget(context, 3),
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
                    clientViewModel.userHomeData.userName,
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
          notificationIcon(() => mainClientViewModel.changeWidget(context, 8)),
        ],
      ),
    ),
    toolbarHeight: 110.h,
    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(35)),
        child: Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isHome
                  ? Text(
                      AppStrings.track_your_shipment,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20),
                    ).tr()
                  : Container(),
              isHome
                  ? Text(
                      AppStrings.track_your_shipment_hint,
                      style: Theme.of(context).textTheme.titleSmall,
                    ).tr()
                  : Container(),
              shipmentSearch(context, clientViewModel.setSearchId,
                  () => clientViewModel.searchShipmentById(context)),
              isHome
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Lottie.asset(
                          JsonAssets.ch,
                          alignment: Alignment.bottomCenter,
                          width: double.maxFinite,
                          height: 300.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : shipmentListStatusBar(
                      context,
                      clientViewModel.changeShipmentListStatusBar,
                      clientViewModel.outputIsShipmentListStatusBarActive),
            ],
          ),
        ),
      ),
      stretchModes: const <StretchMode>[
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
    ),
  );
}
