import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

 toastWidget(String message)
{
   Fluttertoast.showToast(
      msg: message.tr(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      textColor: ColorManager.black,
      backgroundColor: ColorManager.primary.withOpacity(0.7),
      fontSize: 16.0);


}