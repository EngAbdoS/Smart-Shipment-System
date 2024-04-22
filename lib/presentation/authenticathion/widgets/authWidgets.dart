import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/cirular_button.dart';

Widget nameInputWidget(Stream<bool> outputIsFirstNameValid, Function setName,
    TextEditingController nameTextEditingController) {
  return StreamBuilder<bool>(
      stream: outputIsFirstNameValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (name) => setName(name),
          //  _viewModel.setFirstName(firstName),
          keyboardType: TextInputType.name,
          controller: nameTextEditingController,
          //_firstNameController,
          decoration: InputDecoration(
            // label: Text(AppStrings.username.tr()),
            hintText: AppStrings.nameHint.tr(),
            labelText: AppStrings.name.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.nameHint.tr(),
          ),
        );
      });
}

Widget nationalIdInputWidget(
    Stream<bool> outputIsNationalIdValid,
    Function setNationalID,
    TextEditingController nationalIdTextEditingController) {
  return StreamBuilder<bool>(
      stream: outputIsNationalIdValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (NID) => setNationalID(NID),
          keyboardType: TextInputType.number,
          controller: nationalIdTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.nationalIdHint.tr(),
            labelText: AppStrings.nationalId.tr(),
            errorText: (snapshot.data ?? true)
                ? null
                : AppStrings.nationalIdError.tr(),
          ),
        );
      });
}

Widget phoneNumberInputWidget(
    Stream<bool> outputIsPhoneNumberValid,
    Function setPhoneNumber,
    TextEditingController phoneNumberTextEditingController) {
  return StreamBuilder<bool>(
      stream: outputIsPhoneNumberValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (phoneNumber) => setPhoneNumber(phoneNumber),
          keyboardType: TextInputType.phone,
          controller: phoneNumberTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.phoneNumberHint.tr(),
            labelText: AppStrings.phoneNumber.tr(),
            errorText: (snapshot.data ?? true)
                ? null
                : AppStrings.phoneNumberError.tr(),
          ),
        );
      });
}

Widget addressInputWidget(Stream<bool> outputIsAddressValid,
    Function setAddress, TextEditingController addressTextEditingController) {
  return StreamBuilder<bool>(
      stream: outputIsAddressValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (address) => setAddress(address),
          keyboardType: TextInputType.streetAddress,
          controller: addressTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.addressHint.tr(),
            labelText: AppStrings.address.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.addressHint.tr(),
          ),
        );
      });
}

Widget dateOfBirthInputWidget(
    BuildContext context,
    Stream<bool> outputIsDateOfBirthValid,
    Function setDateOfBirth,
    TextEditingController dateOfBirthTextEditingController) {
  DateTime? pickedDate;
  return StreamBuilder<bool>(
      stream: outputIsDateOfBirthValid,
      builder: (context, snapshot) {
        return TextFormField(
          //  enabled: false,
          readOnly: true,
          onTap: () async {
            pickedDate = await showDatePicker(
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                // initialEntryMode=DatePickerEntryMode.input,
                // barrierColor: ColorManager.primary,
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100));
            setDateOfBirth(pickedDate ?? DateTime(0));
            dateOfBirthTextEditingController.text =
                "${pickedDate?.year ?? "0"}-${pickedDate?.month ?? "0"}-${pickedDate?.day ?? "0"}";
          },

          controller: dateOfBirthTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.dateBirthError.tr(),
            labelText: AppStrings.dateBirth.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.dateBirthError.tr(),
          ),
        );
      });
}

Widget genderWidget(
    BuildContext context, Stream<bool> outputGenderValid, Function setGender) {
  return StreamBuilder<bool>(
      stream: outputGenderValid,
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => setGender(true),
              child: Container(
                height: AppSize.s24,
                width: AppSize.s24,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: (snapshot.data ?? false)
                            ? ColorManager.primary
                            : ColorManager.gray),
                    shape: BoxShape.circle,
                    color: (snapshot.data ?? false)
                        ? ColorManager.primary
                        : ColorManager.noColor),
              ),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              AppStrings.male,
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
            const SizedBox(
              width: AppSize.s18 * 2,
            ),
            GestureDetector(
              onTap: () => setGender(false),
              child: Container(
                height: AppSize.s24,
                width: AppSize.s24,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: (snapshot.data ?? false)
                            ? ColorManager.gray
                            : ColorManager.primary),
                    shape: BoxShape.circle,
                    color: (snapshot.data ?? true)
                        ? ColorManager.noColor
                        : ColorManager.primary),
              ),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              AppStrings.female,
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
          ],
        );
      });
}
Widget signInWidget(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.haveAcc,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorManager.black),
        ).tr(),
        TextButton(
          onPressed: () =>
              GoRouter.of(context).pushReplacement(Routes.loginViewRoute),
          child: Text(
            AppStrings.signIn,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ColorManager.black,
              decoration: TextDecoration.underline,
            ),
          ).tr(),
        )
      ],
    ),
  );
}
Widget nextRegistrationPage(BuildContext context ,Function  nextPage,int currentPageIndex)
{
  return    CircularButton(
      buttonAction: () => nextPage(context, 1),
      buttonWidget: Transform.flip(
        flipX: true,
        child: SvgPicture.asset(
          IconAssets.arrowRight,
          color: ColorManager.black,
        ),
      ));



}