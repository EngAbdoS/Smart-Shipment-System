import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/font_manager.dart';
import 'package:smart_shipment_system/presentation/resources/styles_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.offWhite,
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.gray,
    splashColor: ColorManager.offWhite,
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.gray,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.shadowColor,
      titleTextStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s16,
          fontFamily: FontConstants.fontFamilyInter),
    ),
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.gray,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.offWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
            color: ColorManager.white,
            fontSize: FontSize.s17,
            fontFamily: FontConstants.fontFamilyInter),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: getBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s18,
          fontFamily: FontConstants.fontFamilyInter),
      headlineMedium: getRegularStyle(
          color: ColorManager.darkGray,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyInter),
      titleLarge: getMediumStyle(
          color: ColorManager.lightGray,
          fontSize: AppSize.s14,
          fontFamily: FontConstants.fontFamilyInter),
      titleMedium: getSemiBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyInter),
      titleSmall: getRegularStyle(
          color: ColorManager.black,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyInter),
      labelSmall: getBoldStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyInter),
      bodyLarge: getExtraBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyInter),
      bodySmall: getSemiBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyInter),
      bodyMedium: getMediumStyle(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyInter),
      displayLarge: getSemiBoldStyle(
          color: ColorManager.darkGray,
          fontSize: FontSize.s16,
          fontFamily: FontConstants.fontFamilyInter),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
          color: ColorManager.inputField,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyInter),
      labelStyle: getMediumStyle(
          color: ColorManager.inputField,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyInter),
      errorStyle: getRegularStyle(
          color: ColorManager.error, fontFamily: FontConstants.fontFamilyInter),
      enabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.inputField, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s24),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}

ThemeData getArabicAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.offWhite,
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.gray,
    splashColor: ColorManager.offWhite,
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.gray,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.shadowColor,
      titleTextStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s16,
          fontFamily: FontConstants.fontFamilyRubik),
    ),
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.gray,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.offWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
            color: ColorManager.white,
            fontSize: FontSize.s17,
            fontFamily: FontConstants.fontFamilyRubik),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: getBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s18,
          fontFamily: FontConstants.fontFamilyRubik),
      headlineMedium: getRegularStyle(
          color: ColorManager.darkGray,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyRubik),
      titleLarge: getMediumStyle(
          color: ColorManager.lightGray,
          fontSize: AppSize.s14,
          fontFamily: FontConstants.fontFamilyRubik),
      titleMedium: getSemiBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyRubik),
      titleSmall: getRegularStyle(
          color: ColorManager.black,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyRubik),
      labelSmall: getBoldStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyRubik),
      bodyLarge: getExtraBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyRubik),
      bodySmall: getSemiBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyRubik),
      bodyMedium: getMediumStyle(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyRubik),
      displayLarge: getSemiBoldStyle(
          color: ColorManager.darkGray,
          fontSize: FontSize.s16,
          fontFamily: FontConstants.fontFamilyRubik),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
          color: ColorManager.inputField,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyRubik),
      labelStyle: getMediumStyle(
          color: ColorManager.inputField,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyRubik),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
        fontFamily: FontConstants.fontFamilyRubik,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.inputField, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s24),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
