import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';

import 'package:smart_shipment_system/presentation/authenticathion/clientRegistration/viewModel/clientRegistrationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/authWidgets.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

class ClientRegistrationView extends StatelessWidget {
  ClientRegistrationView({super.key});

  final ClientRegistrationViewModel _viewModel =
      instance<ClientRegistrationViewModel>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mainClientRegistrationWidget(context));

  }

  SingleChildScrollView mainClientRegistrationWidget(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              authLogoWidget(),

              Text(
                AppStrings.createAcc,
                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),

              nameInputWidget(_viewModel.outputIsFirstNameValid,
                  _viewModel.setFirstName),
              SizedBox(
                height: 15.sp,
              ),
            //  nameWidget(),
            //   const SizedBox(
            //     height: AppSize.s28,
            //   ),
              phoneNumberInputWidget(_viewModel.outputIsPhoneNumberValid,
                  _viewModel.setPhoneNumber),
              SizedBox(
                height: 15.sp,
              ),
              // phoneNumberWidget(),
              // const SizedBox(
              //   height: AppSize.s28,
              // ),
              addressWidget(),
              const SizedBox(
                height: AppSize.s28,
              ),
              emailWidget(),
              const SizedBox(
                height: AppSize.s28,
              ),
              passwordWidgets(),
              const SizedBox(
                height: AppSize.s28,
              ),
              dateOfBirthWidget(context),
              const SizedBox(
                height: AppSize.s28,
              ),
              genderWidget(context),
              const SizedBox(
                height: AppSize.s28,
              ),
              RegularButton(
                buttonAction: () => _viewModel.getLoading(context),
                buttonWidget: Text(
                  AppStrings.createAcc,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              signInWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget addressWidget() {
    return StreamBuilder<bool>(
        stream: _viewModel.outputIsAddressValid,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: (address) => _viewModel.setAddress(address),
            keyboardType: TextInputType.streetAddress,
            controller: _addressController,
            decoration: InputDecoration(
              // label: Text(AppStrings.username.tr()),
              hintText: AppStrings.addressHint.tr(),
              labelText: AppStrings.address.tr(),
              errorText:
                  (snapshot.data ?? true) ? null : AppStrings.addressHint.tr(),
            ),
          );
        });
  }

  Widget emailWidget() {
    return StreamBuilder<bool>(
        stream: _viewModel.outputIsEmailValid,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: (email) => _viewModel.setEmail(email),
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
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

  Widget phoneNumberWidget() {
    return StreamBuilder<bool>(
        stream: _viewModel.outputIsPhoneNumberValid,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: (phoneNumber) => _viewModel.setPhoneNumber(phoneNumber),
            keyboardType: TextInputType.phone,
            controller: _phoneNumberController,
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

  Widget passwordWidgets() {
    return Column(
      children: [
        StreamBuilder<bool>(
          builder: (context, snapshot) {
            return StreamBuilder<bool>(
                stream: _viewModel.outputIsPasswordHidden,
                builder: (context, hiddenState) {
                  return TextFormField(
                    onChanged: (password) => {
                      _viewModel.setPassword(password),
                      _viewModel.validateConfirmPassword(),
                    },
                    obscureText: hiddenState.data ?? true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            _viewModel.changePasswordState();
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
          stream: _viewModel.outputIsPasswordValid,
        ),
        const SizedBox(
          height: AppSize.s28,
        ),
        StreamBuilder<bool>(
          builder: (context, snapshot) {
            return StreamBuilder<bool>(
                stream: _viewModel.outputIsConfirmPasswordHidden,
                builder: (context, hiddenState) {
                  return TextFormField(
                    onChanged: (confirmPassword) =>
                        _viewModel.setConfirmPassword(confirmPassword),
                    obscureText: hiddenState.data ?? true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            _viewModel.changeConfirmPasswordState();
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
          stream: _viewModel.outputIsConfirmPasswordValid,
        ),
      ],
    );
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

  Widget nameWidget() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: StreamBuilder<bool>(
                stream: _viewModel.outputIsFirstNameValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (firstName) =>
                        _viewModel.setFirstName(firstName),
                    keyboardType: TextInputType.name,
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      // label: Text(AppStrings.username.tr()),
                      hintText: AppStrings.fNameHint.tr(),
                      labelText: AppStrings.fName.tr(),
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.fNameHint.tr(),
                    ),
                  );
                }),
          ),
          const SizedBox(
            width: AppSize.s8 * 2,
          ),
          Expanded(
            child: StreamBuilder<bool>(
                stream: _viewModel.outputIsLastNameValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (lastName) => _viewModel.setLastName(lastName),
                    keyboardType: TextInputType.name,
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      // label: Text(AppStrings.username.tr()),
                      hintText: AppStrings.lNameHint.tr(),
                      labelText: AppStrings.lName.tr(),
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.lNameHint.tr(),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget dateOfBirthWidget(BuildContext context) {
    DateTime? pickedDate;
    return StreamBuilder<bool>(
        stream: _viewModel.outputIsBirthDayValid,
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
              _viewModel.setBirthDate(pickedDate ?? DateTime(0));
              _birthDateController.text =
                  "${pickedDate?.year ?? "0"}-${pickedDate?.month ?? "0"}-${pickedDate?.day ?? "0"}";
            },

            controller: _birthDateController,
            decoration: InputDecoration(
              hintText: AppStrings.dateBirthError.tr(),
              labelText: AppStrings.dateBirth.tr(),
              errorText: (snapshot.data ?? true)
                  ? null
                  : AppStrings.dateBirthError.tr(),
            ),
          );
        });
  }

  Widget genderWidget(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _viewModel.outputIsGenderManValid,
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => _viewModel.setGender(true),
                child: Container(
                  height: AppSize.s24,
                  width: AppSize.s24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (snapshot.data ?? false)
                          ? ColorManager.primary
                          : ColorManager.gray),
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
                onTap: () => _viewModel.setGender(false),
                child: Container(
                  height: AppSize.s24,
                  width: AppSize.s24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (snapshot.data ?? true)
                          ? ColorManager.gray
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
}
