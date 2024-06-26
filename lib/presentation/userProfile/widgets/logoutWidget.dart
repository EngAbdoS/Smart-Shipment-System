import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/userProfile/viewModel/clientUserProfileViewModel.dart';

Widget logoutWidget(BuildContext context, UserProfileViewModel viewModel) {
  return GestureDetector(
    onTap: () => {
      viewModel.logout(context),
      //dispose(),
    },
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: ColorManager.lightGray.withOpacity(0.3),
                shape: BoxShape.circle),
            child: const Icon(
              Icons.logout,
              color: ColorManager.primary,
            ),
          ),
          SizedBox(
            width: 14.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.logout,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: ColorManager.primary, fontSize: 17))
                  .tr(),
              SizedBox(
                height: 5.h,
              ),
              Text(
                AppStrings.safe_logout,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: ColorManager.gray, fontSize: 8),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ).tr(),
            ],
          ),
        ],
      ),
    ),
  );
}
