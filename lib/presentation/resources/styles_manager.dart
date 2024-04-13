import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,String fontFamily) {
  return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
     fontFamily: fontFamily
     // fontFamily: FontConstants.fontFamilyInter
  );
}

TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s14, required Color color,required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color,fontFamily);
}

TextStyle getBoldStyle({double fontSize = FontSize.s14, required Color color,required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color,fontFamily);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s14, required Color color,required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,fontFamily);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color,required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,fontFamily);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color,required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,fontFamily);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s14, required Color color,required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,fontFamily);
}
