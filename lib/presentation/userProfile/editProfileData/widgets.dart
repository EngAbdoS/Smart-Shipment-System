import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/optWidget/pickImage.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

Widget userEditProfileImage(
    BuildContext context,
    Function setImage,
    Stream<String?> outputProfileImageStream,
    Stream<bool?> outputIsProfileImageEditingStream) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30.h),
    child: GestureDetector(
      onTap: () => pickImage(context, setImage),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          StreamBuilder<String?>(
              stream: outputProfileImageStream,
              builder: (context, snapshot) {
                return StreamBuilder<bool?>(
                    stream: outputIsProfileImageEditingStream,
                    builder: (context, editingSnapshot) {
                      return (editingSnapshot.data ?? false)?Padding(
                        padding: EdgeInsets.all(15.h),
                        child: Container(
                          height: 200.h,
                          width: 200.h,

                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                       Image.file(
                                          File(snapshot.data ?? ""),
                                          fit: BoxFit.cover,
                                        ).image
                                      )),
                        ),
                      ):  ProfileCirclerImage(
                        imageUrl: snapshot.data ?? "",
                        navigate: () {},size: 220.h,
                      );
                    });
              }),
          Padding(
            padding: EdgeInsets.all(20.h),
            child: Container(
              width: 50.h,
              height: 50.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.gray.withOpacity(0.5)),
              child: Icon(
                Icons.imagesearch_roller_outlined,
                color: ColorManager.primary,
                size: 30.h,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget nameEditInputWidget(BuildContext context,
    Stream<String?> outputIsNameValid, Function setName, Function validate) {
  TextEditingController nameTextEditingController = TextEditingController();
  bool start = false;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppStrings.name,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.black, fontSize: 12),
      ).tr(),
      const SizedBox(
        height: 5,
      ),
      StreamBuilder<String?>(
          stream: outputIsNameValid,
          builder: (context, snapshot) {
            return TextFormField(
              onChanged: (name) => setName(name.trim()),
              onTap: () => start = true,
              keyboardType: TextInputType.name,
              controller: nameTextEditingController,
              decoration: InputDecoration(
                hintText: AppStrings.nameHint.tr(),
                labelText: snapshot.data ?? AppStrings.nameHint.tr(),
                errorText: (start)
                    ? validate(nameTextEditingController.text)
                        ? null
                        : AppStrings.nameHint.tr()
                    : null,
              ),
            );
          }),
    ],
  );
}

Widget emailEditInputWidget(BuildContext context,
    Stream<String?> outputIsEmailValid, Function setEmail, Function validate) {
  TextEditingController emailTextEditingController = TextEditingController();
  bool start = false;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppStrings.emailHint,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.black, fontSize: 12),
      ).tr(),
      const SizedBox(
        height: 5,
      ),
      StreamBuilder<String?>(
          stream: outputIsEmailValid,
          builder: (context, snapshot) {
            return TextFormField(
              onChanged: (name) => setEmail(name.trim()),
              onTap: () => start = true,
              keyboardType: TextInputType.emailAddress,
              controller: emailTextEditingController,
              decoration: InputDecoration(
                hintText: AppStrings.emailHint.tr(),
                labelText: snapshot.data ?? AppStrings.emailHint.tr(),
                errorText: (start)
                    ? validate(emailTextEditingController.text)
                        ? null
                        : AppStrings.invalidEmail.tr()
                    : null,
              ),
            );
          }),
    ],
  );
}

Widget phoneNumberEditInputWidget(
    BuildContext context,
    Stream<String?> outputIsPhoneNumberValid,
    Function setPhoneNumber,
    Function validate) {
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  bool start = false;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppStrings.phoneNumber,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.black, fontSize: 12),
      ).tr(),
      const SizedBox(
        height: 5,
      ),
      StreamBuilder<String?>(
          stream: outputIsPhoneNumberValid,
          builder: (context, snapshot) {
            return TextFormField(
              onChanged: (phoneNumber) => setPhoneNumber(phoneNumber.trim()),
              onTap: () => start = true,
              keyboardType: TextInputType.phone,
              controller: phoneNumberTextEditingController,
              decoration: InputDecoration(
                hintText: AppStrings.phoneNumberHint.tr(),
                labelText: snapshot.data ?? AppStrings.phoneNumber.tr(),
                errorText: (start)
                    ? validate(phoneNumberTextEditingController.text)
                        ? null
                        : AppStrings.nameHint.tr()
                    : null,
              ),
            );
          }),
    ],
  );
}
