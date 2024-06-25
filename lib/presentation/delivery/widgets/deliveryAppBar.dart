import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/delivery/home/viewModel/deliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

Widget buildDeliverySliverAppBar(
    {required BuildContext context,
    required DeliveryHomeViewModel viewModel,
    required MainDeliveryViewModel mainDeliveryViewModel}) {
  return SliverAppBar(
    pinned: true,
    expandedHeight: 120.w,
    collapsedHeight: 90.h,
    stretch: true,
    snap: true,
    floating: true,
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
        children: [
          ProfileCirclerImage(
            imageUrl: viewModel.userHomeData.profileImage,
            navigate: () => mainDeliveryViewModel.changeWidget(context, 3),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.goodMorning,
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              Text(
                viewModel.userHomeData.userName,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: ColorManager.black, fontSize: 17),
              ).tr(),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.circle_notifications_outlined,
              size: 53.h,
              color: ColorManager.black,
            ),
          ),
        ],
      ),
    ),
    toolbarHeight: 90.h,
    flexibleSpace: FlexibleSpaceBar(

      stretchModes: const <StretchMode>[
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
    ),




  );}