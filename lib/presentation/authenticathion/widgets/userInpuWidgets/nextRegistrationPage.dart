import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/cirular_button.dart';

Widget nextRegistrationPage(
    BuildContext context, Function nextPage, int currentPageIndex) {
  return CircularButton(
    buttonAction: () => nextPage(context, currentPageIndex),
    buttonWidget: SvgPicture.asset(
      IconAssets.arrowRight,
      color: ColorManager.black,
    ),
  );
}
