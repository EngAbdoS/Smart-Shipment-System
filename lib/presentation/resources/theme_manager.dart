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

    //primaryColorLight: ColorManager.lightPrimary,
    // primaryColorDark: ColorManager.darkPrimary,
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
        //statusBarBrightness: Brightness.light,
        // systemStatusBarContrastEnforced: true,
        //statusBarIconBrightness: Brightness.dark
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
        // primary: ColorManager.primary,
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

    //primaryColorLight: ColorManager.lightPrimary,
    // primaryColorDark: ColorManager.darkPrimary,
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
        //statusBarBrightness: Brightness.light,
        // systemStatusBarContrastEnforced: true,
        //statusBarIconBrightness: Brightness.dark
      ),
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.shadowColor,
      titleTextStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s16,
          fontFamily: FontConstants.fontFamilyArabic),
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
            fontFamily: FontConstants.fontFamilyArabic),
        // primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: getBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s18,
          fontFamily: FontConstants.fontFamilyArabic),
      headlineMedium: getRegularStyle(
          color: ColorManager.darkGray,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyArabic),
      titleLarge: getMediumStyle(
          color: ColorManager.lightGray,
          fontSize: AppSize.s14,
          fontFamily: FontConstants.fontFamilyArabic),
      titleMedium: getSemiBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyArabic),
      titleSmall: getRegularStyle(
          color: ColorManager.black,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyArabic),
      labelSmall: getBoldStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyArabic),
      bodyLarge: getExtraBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyArabic),
      bodySmall: getSemiBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyArabic),
      bodyMedium: getMediumStyle(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyArabic),
      displayLarge: getSemiBoldStyle(
          color: ColorManager.darkGray,
          fontSize: FontSize.s16,
          fontFamily: FontConstants.fontFamilyArabic),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
          color: ColorManager.inputField,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyArabic),
      labelStyle: getMediumStyle(
          color: ColorManager.inputField,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.fontFamilyArabic),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
        fontFamily: FontConstants.fontFamilyArabic,
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
