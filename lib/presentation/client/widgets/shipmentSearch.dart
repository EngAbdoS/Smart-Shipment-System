import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget shipmentSearch() {
  TextEditingController shipmentTextEditing = TextEditingController();

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
    child: Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(24),
        // border: Border.all(color: ColorManager.primary, width: 1),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withOpacity(0.15),
            blurRadius: 25,
            offset: const Offset(2, 8),
          )
        ],
      ),
      child: TextFormField(
        onChanged: (password) => {},
        keyboardType: TextInputType.number,
        controller: shipmentTextEditing,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search_sharp,
              weight: 100,
              color: ColorManager.black,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.inputField, width: 0),
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.primary, width: 0),
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            hintText: AppStrings.shipment_number.tr(),
            //  labelText: AppStrings.shipment_number.tr(),
            //errorText:  AppStrings.passwordInvalid.tr(),
            errorMaxLines: 2),
      ),
    ),
  );
}
