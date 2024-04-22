import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/language_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {super.key,
      this.buttonColor = ColorManager.primary,
      required this.buttonAction,
      required this.buttonWidget});

  final Color buttonColor;
  final Widget buttonWidget;
  final GestureTapCallback buttonAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction,
      child: Container(
        alignment: Alignment.center,
        height: WidgetsValues.circularButtonSize,
        width: WidgetsValues.circularButtonSize,
        //color: buttonColor,
        decoration: BoxDecoration(
          color: buttonColor,
          // borderRadius:
          //     BorderRadius.circular(WidgetsValues.regularButtonRadius),
          // boxShadow: const [
          //   BoxShadow(
          //     color: ColorManager.shadowColor,
          //     spreadRadius: 0,
          //     blurRadius: 16,
          //     offset: Offset(2, 8),
          //   )
          // ]

          shape: BoxShape.circle,
        ),
        child: Transform.flip(
            flipX: context.locale == ARABIC_LOCAL ? true : false,
            child: buttonWidget),
      ),
    );
  }
}
