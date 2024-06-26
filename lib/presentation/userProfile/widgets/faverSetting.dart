import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

Widget faverSetting(BuildContext context, Widget sectionWidget, String title,
    String hint, IconData icon) {
  return Container(
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
          child: Icon(
            icon,
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
            Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: ColorManager.black, fontSize: 17))
                .tr(),
            SizedBox(
              height: 5.h,
            ),
            Text(
              hint,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorManager.gray, fontSize: 8),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ).tr(),
          ],
        ),
        const Spacer(),
        sectionWidget,
      ],
    ),
  );
}
