import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

class RegularButton extends StatelessWidget {
  const RegularButton(
      {super.key,
      this.buttonColor = ColorManager.primary,
      this.buttonWidth = 0,
      required this.buttonAction,
      required this.buttonWidget});

  final Color buttonColor;
  final int buttonWidth;
  final Widget buttonWidget;
  final GestureTapCallback buttonAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction,
      child: Container(
        alignment: Alignment.center,
        height: WidgetsValues.regularButtonHeight,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius:
                BorderRadius.circular(WidgetsValues.regularButtonRadius),
            boxShadow: const [
              BoxShadow(
                color: ColorManager.shadowColor,
                spreadRadius: 0,
                blurRadius: 16,
                offset: Offset(2, 8),
              )
            ]),
        child: buttonWidget,
      ),
    );
  }
}
