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
    cardTheme: CardTheme(
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
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.gray,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.offWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17,
        ),
        // primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge:
          getBoldStyle(color: ColorManager.black, fontSize: FontSize.s18),
      headlineMedium:
          getRegularStyle(color: ColorManager.darkGray, fontSize: FontSize.s14),
      titleLarge:
          getMediumStyle(color: ColorManager.lightGray, fontSize: AppSize.s14),
      titleMedium:
          getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s14),
      titleSmall:
          getRegularStyle(color: ColorManager.black, fontSize: FontSize.s12),
      labelSmall:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      bodyLarge: getExtraBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),
      bodySmall: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s12),
      bodyMedium:
          getRegularStyle(color: ColorManager.darkGray, fontSize: FontSize.s12),
      displayLarge: getSemiBoldStyle(
          color: ColorManager.darkGray, fontSize: FontSize.s16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManager.gray, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.gray, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
