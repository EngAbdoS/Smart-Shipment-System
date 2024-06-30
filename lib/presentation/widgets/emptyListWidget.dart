import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

Widget emptyListWidget(BuildContext context,
    {String message = '', GestureTapCallback actionButton = noFun}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SvgPicture.asset(
          SVGAssets.noData,
          height: 200,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: ColorManager.primary.withOpacity(0.15),
                blurRadius: 25,
                offset: const Offset(2, 8),
              )
            ]),
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ).tr(),
      ),
      if (actionButton != noFun)
        Padding(
          padding: const EdgeInsets.all(25),
          child: RegularButton(
            buttonAction: actionButton,
            buttonWidget: const Text(
              AppStrings.retryAgain,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ).tr(),
          ),
        ),
      const SizedBox(height: 20),

    ],
  );
}
