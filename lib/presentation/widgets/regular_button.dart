import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

class RegularButton extends StatelessWidget {
  const RegularButton(
      {super.key,
      this.buttonColor = ColorManager.primary,this.shadowColor=ColorManager.shadowColor,
      this.buttonWidth = 0,
      required this.buttonAction,
      required this.buttonWidget});

  final Color buttonColor;
  final Color shadowColor;
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
            boxShadow:  [
              BoxShadow(
                color: shadowColor,
                spreadRadius: 0,
                blurRadius: 16,
                offset: const Offset(2, 8),
              )
            ]),
        child: buttonWidget,
      ),
    );
  }
}
