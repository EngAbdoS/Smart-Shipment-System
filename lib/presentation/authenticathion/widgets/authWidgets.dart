import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/cirular_button.dart';

Widget nameInputWidget(
  Stream<bool> outputIsFirstNameValid,
  Function setName,
) {
  TextEditingController nameTextEditingController = TextEditingController();
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
) {
  TextEditingController nationalIdTextEditingController =
      TextEditingController();
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
) {
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
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

Widget addressInputWidget(
  Stream<bool> outputIsAddressValid,
  Function setAddress,
) {
  TextEditingController addressTextEditingController = TextEditingController();
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

Widget vehicleInputWidget(Stream<bool> outputIsVehicleValid,
    Function setVehicle, ) {
  TextEditingController vehicleTextEditingController = TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsVehicleValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (vehicle) => setVehicle(vehicle),
          keyboardType: TextInputType.text,
          controller: vehicleTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.vehicleHint.tr(),
            labelText: AppStrings.vehicleType.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.vehicleError.tr(),
          ),
        );
      });
}

Widget emailInputWidget(
  Stream<bool> outputIsEmailValid,
  Function setEmail,
) {
  TextEditingController emailTextEditingController = TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsEmailValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (email) => setEmail(email),
          keyboardType: TextInputType.emailAddress,
          controller: emailTextEditingController,
          //_firstNameController,
          decoration: InputDecoration(
            // label: Text(AppStrings.username.tr()),
            hintText: AppStrings.emailHint.tr(),
            labelText: AppStrings.emailHint.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.invalidEmail.tr(),
          ),
        );
      });
}

Widget deliveryConfirmationPictureInputWidget(
  BuildContext contextt,
  Stream<File> outputDeliveryConfirmationPicture,
  Stream<bool> outputIsDeliveryConfirmationPictureValid,
  Function setDeliveryConfirmationPicture,
) {
  final ImagePicker _imagePicker = ImagePicker();
  return StreamBuilder<File>(
      stream: outputDeliveryConfirmationPicture,
      builder: (context, fileSnapshot) {
        return StreamBuilder<bool>(
            stream: outputIsDeliveryConfirmationPictureValid,
            builder: (context, snapshot) {
              return TextFormField(
                //  enabled: false,
                readOnly: true,
                minLines: 3,
                maxLines: 5,

                onTap: () async {
                  showModalBottomSheet(
                      context: contextt,
                      builder: (BuildContext context) {
                        return SafeArea(
                            child: Wrap(
                          children: [
                            ListTile(
                              trailing: const Icon(Icons.arrow_forward),
                              leading: const Icon(Icons.photo),
                              title: const Text(AppStrings.photoGallery).tr(),
                              onTap: () async {
                                var image = await _imagePicker.pickImage(
                                    source: ImageSource.gallery);
                                setDeliveryConfirmationPicture(
                                    File(image?.path ?? ""));
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              trailing: const Icon(Icons.arrow_forward),
                              leading: const Icon(Icons.camera_alt_outlined),
                              title: const Text(AppStrings.photoCamera).tr(),
                              onTap: () async {
                                var image = await _imagePicker.pickImage(
                                    source: ImageSource.camera);
                                setDeliveryConfirmationPicture(
                                    File(image?.path ?? ""));
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ));
                      });
                },

                // controller: dateOfBirthTextEditingController,
                decoration: InputDecoration(
                  hintText: (snapshot.data ?? true)
                      ? fileSnapshot.data?.path
                      : AppStrings.confirmationPictureHint.tr(),
                  hintMaxLines: 1,
                  labelText: AppStrings.confirmationPicture.tr(),
                  errorText: (snapshot.data ?? true)
                      ? null
                      : AppStrings.confirmationPictureHint.tr(),
                ),
              );
            });
      });
}

Widget deliveryVehicleLicensePictureInputWidget(
  BuildContext contextt,
  Stream<File> outputDeliveryVehicleLicensePicture,
  Stream<bool> outputIsDeliveryVehicleLicensePictureValid,
  Function setDeliveryVehicleLicensePicture,
) {
  final ImagePicker _imagePicker = ImagePicker();
  return Column(
    children: [
      StreamBuilder<File>(
          stream: outputDeliveryVehicleLicensePicture,
          builder: (context, fileSnapshot) {
            return StreamBuilder<bool>(
                stream: outputIsDeliveryVehicleLicensePictureValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    //  enabled: false,
                    readOnly: true,
                    minLines: 3,
                    maxLines: 5,

                    onTap: () async {
                      showModalBottomSheet(
                          context: contextt,
                          builder: (BuildContext context) {
                            return SafeArea(
                                child: Wrap(
                              children: [
                                ListTile(
                                  trailing: const Icon(Icons.arrow_forward),
                                  leading: const Icon(Icons.photo),
                                  title:
                                      const Text(AppStrings.photoGallery).tr(),
                                  onTap: () async {
                                    var image = await _imagePicker.pickImage(
                                        source: ImageSource.gallery);
                                    setDeliveryVehicleLicensePicture(
                                        File(image?.path ?? ""));
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  trailing: const Icon(Icons.arrow_forward),
                                  leading:
                                      const Icon(Icons.camera_alt_outlined),
                                  title:
                                      const Text(AppStrings.photoCamera).tr(),
                                  onTap: () async {
                                    var image = await _imagePicker.pickImage(
                                        source: ImageSource.camera);
                                    setDeliveryVehicleLicensePicture(
                                        File(image?.path ?? ""));
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ));
                          });
                    },

                    // controller: dateOfBirthTextEditingController,
                    decoration: InputDecoration(
                      hintText: (snapshot.data ?? true)
                          ? fileSnapshot.data?.path
                          : AppStrings.vehicleLicenseHint.tr(),
                      hintMaxLines: 1,
                      labelText: AppStrings.vehicleLicense.tr(),
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.vehicleLicenseHint.tr(),
                    ),
                  );
                });
          }),
      SizedBox(
        height: 30.sp,
      ),
      Text(
        AppStrings.noVehicleHint,
        style: Theme.of(contextt)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.error.withOpacity(0.5), fontSize: 12),
      ).tr(),
    ],
  );
}

Widget deliveryRole(BuildContext context, Function setRole) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        AppStrings.deliveryRole,
        style: Theme.of(context).textTheme.titleMedium,
      ).tr().animate(delay: 300.milliseconds).fade(
          duration: 300.milliseconds,
          curve: Curves.fastEaseInToSlowEaseOut),
      SizedBox(
        height: 80.sp,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setRole(context, AppConstants.deliveryRoleInternal),
            child: Container(
              height: 110.sp,
              width: 150.sp,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                    color: ColorManager.shadowColor.withOpacity(0.25),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  AppStrings.deliveryInternal,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
            ),
          ).animate()
              .slideX(begin: 0.5, end: 0.0, curve: Curves.easeInOutBack),
          GestureDetector(
            onTap: () => setRole(context, AppConstants.deliveryRoleExternal),
            child: Container(
              height: 110.sp,
              width: 150.sp,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                    color: ColorManager.shadowColor.withOpacity(0.25),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  AppStrings.deliveryExternal,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
            ),
          ).animate()
              .slideX(begin: -0.5, end: 0.0, curve: Curves.easeInOutBack),
        ],
      ),
      SizedBox(
        height: 80.sp,
      ),
      Text(
        AppStrings.deliveryInternalDescription,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.error.withOpacity(0.5), fontSize: 12),
      ).tr(),
      SizedBox(
        height: 10.sp,
      ),
      Text(
        AppStrings.deliveryExternalDescription,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.error.withOpacity(0.5), fontSize: 12),
      ).tr().animate(delay: 300.milliseconds).fade(
          duration: 300.milliseconds,
          curve: Curves.fastEaseInToSlowEaseOut),
    ],
  );
}

// _imageFromGallery() async {
//   var image = await _imagePicker.pickImage(source: ImageSource.gallery);
//   _viewModel.setProfilePicture(File(image?.path ?? ""));
// }
//
// _imageFromCamera() async {
//   var image = await _imagePicker.pickImage(source: ImageSource.camera);
//   _viewModel.setProfilePicture(File(image?.path ?? ""));
// }
Widget passwordWidgets(
    Stream<bool> outputIsPasswordValid,
    Stream<bool> outputIsConfirmPasswordValid,
    Stream<bool> outputIsPasswordHidden,
    Stream<bool> outputIsConfirmPasswordHidden,
    Function setPassword,
    Function setConfirmPassword,
    Function validateConfirmPassword,
    Function changePasswordState,
    Function changeConfirmPasswordState) {
  return Column(
    children: [
      passwordInputWidget(outputIsPasswordHidden, setPassword,
          validateConfirmPassword, changePasswordState, outputIsPasswordValid),
      SizedBox(
        height: 15.sp,
      ),
      confirmPasswordInputWidget(
          outputIsConfirmPasswordHidden,
          setConfirmPassword,
          changeConfirmPasswordState,
          outputIsConfirmPasswordValid),
    ],
  );
}

StreamBuilder<bool> confirmPasswordInputWidget(
    Stream<bool> outputIsConfirmPasswordHidden,
    Function setConfirmPassword,
    Function changeConfirmPasswordState,
    Stream<bool> outputIsConfirmPasswordValid) {
  TextEditingController confirmPasswordTextEditing = TextEditingController();

  return StreamBuilder<bool>(
    builder: (context, snapshot) {
      return StreamBuilder<bool>(
          stream: outputIsConfirmPasswordHidden,
          builder: (context, hiddenState) {
            return TextFormField(
              onChanged: (confirmPassword) =>
                  setConfirmPassword(confirmPassword),
              obscureText: hiddenState.data ?? true,
              keyboardType: TextInputType.visiblePassword,
              controller: confirmPasswordTextEditing,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      changeConfirmPasswordState();
                    },
                    icon: Icon(
                      (hiddenState.data ?? true)
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      color: ColorManager.primary,
                    ),
                  ),
                  hintText: AppStrings.confirmPass.tr(),
                  labelText: AppStrings.confirmPass.tr(),
                  errorText: (snapshot.data ?? true)
                      ? null
                      : AppStrings.confirmPassError.tr(),
                  errorMaxLines: 2),
            );
          });
    },
    stream: outputIsConfirmPasswordValid,
  );
}

Widget passwordInputWidget(
    Stream<bool> outputIsPasswordHidden,
    Function setPassword,
    Function validateConfirmPassword,
    Function changePasswordState,
    Stream<bool> outputIsPasswordValid) {
  TextEditingController passwordTextEditing = TextEditingController();

  return StreamBuilder<bool>(
    builder: (context, snapshot) {
      return StreamBuilder<bool>(
          stream: outputIsPasswordHidden,
          builder: (context, hiddenState) {
            return TextFormField(
              onChanged: (password) => {
                setPassword(password),
                validateConfirmPassword(),
              },
              obscureText: hiddenState.data ?? true,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordTextEditing,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      changePasswordState();
                    },
                    icon: Icon(
                      (hiddenState.data ?? true)
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      color: ColorManager.primary,
                    ),
                  ),
                  hintText: AppStrings.password.tr(),
                  labelText: AppStrings.password.tr(),
                  errorText: (snapshot.data ?? true)
                      ? null
                      : AppStrings.passwordInvalid.tr(),
                  errorMaxLines: 2),
            );
          });
    },
    stream: outputIsPasswordValid,
  );
}

Widget dateOfBirthInputWidget(
  BuildContext context,
  Stream<bool> outputIsDateOfBirthValid,
  Function setDateOfBirth,
) {
  TextEditingController dateOfBirthTextEditingController =
      TextEditingController();
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
                            ? ColorManager.primary
                            : ColorManager.gray),
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

Widget nextRegistrationPage(
    BuildContext context, Function nextPage, int currentPageIndex) {
  return CircularButton(
    buttonAction: () => nextPage(context, currentPageIndex),
    buttonWidget: SvgPicture.asset(
      IconAssets.arrowRight,
      color: ColorManager.black,
    ),
  );
}
