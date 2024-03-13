import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/presentation/authenticathion/clientRegistration/manager/clientRegistrationCubit.dart';
import 'package:smart_shipment_system/presentation/authenticathion/clientRegistration/manager/clientRegistrationCubitStates.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class ClientRegistrationView extends StatelessWidget {
  ClientRegistrationView({super.key});

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
    return BlocBuilder<ClientRegistrationCubit, ClientRegistrationCubitStates>(
        builder: (context, state) {
      final clientRegistrationCubit = context.read<ClientRegistrationCubit>();

      if (state is ClientRegistrationInitial) {
        return Scaffold(
          body: SingleChildScrollView(
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
                    const SizedBox(
                      height: AppSize.s18 * 2,
                    ),
                    nameWidget(clientRegistrationCubit),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    phoneNumberWidget(clientRegistrationCubit),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    addressWidget(clientRegistrationCubit),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    emailWidget(clientRegistrationCubit),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    passwordWidgets(clientRegistrationCubit),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    dateOfBirthWidget(clientRegistrationCubit, context),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    genderWidget(clientRegistrationCubit, context),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    RegularButton(
                      buttonAction: () =>
                          clientRegistrationCubit.getLoading(context),
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
          ),
        );
      } else if (state is ClientRegistrationLoading) {
        testState(context);
        return Container();
      } else if (state is ClientRegistrationSuccess) {
        return Container();
      } else {
        return const Text("a7a");
      }
    });
  }

  Widget addressWidget(ClientRegistrationCubit clientRegistrationCubit) {
    return StreamBuilder<bool>(
        stream: clientRegistrationCubit
            .baseRegistrationViewModel.outputIsAddressValid,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: (address) => clientRegistrationCubit
                .baseRegistrationViewModel
                .setAddress(address),
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

  Widget emailWidget(ClientRegistrationCubit clientRegistrationCubit) {
    return StreamBuilder<bool>(
        stream: clientRegistrationCubit
            .baseRegistrationViewModel.outputIsEmailValid,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: (email) => clientRegistrationCubit
                .baseRegistrationViewModel
                .setEmail(email),
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

  Widget phoneNumberWidget(ClientRegistrationCubit clientRegistrationCubit) {
    return StreamBuilder<bool>(
        stream: clientRegistrationCubit
            .baseRegistrationViewModel.outputIsPhoneNumberValid,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: (phoneNumber) => clientRegistrationCubit
                .baseRegistrationViewModel
                .setPhoneNumber(phoneNumber),
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

  Widget passwordWidgets(ClientRegistrationCubit clientRegistrationCubit) {
    return Column(
      children: [
        StreamBuilder<bool>(
          builder: (context, snapshot) {
            return StreamBuilder<bool>(
                stream: clientRegistrationCubit
                    .baseRegistrationViewModel.outputIsPasswordHidden,
                builder: (context, hiddenState) {
                  return TextFormField(
                    onChanged: (password) => {
                      clientRegistrationCubit.baseRegistrationViewModel
                          .setPassword(password),
                      clientRegistrationCubit.baseRegistrationViewModel
                          .validateConfirmPassword(),
                    },
                    obscureText: hiddenState.data ?? true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            clientRegistrationCubit.baseRegistrationViewModel
                                .changePasswordState();
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
          stream: clientRegistrationCubit
              .baseRegistrationViewModel.outputIsPasswordValid,
        ),
        const SizedBox(
          height: AppSize.s28,
        ),
        StreamBuilder<bool>(
          builder: (context, snapshot) {
            return StreamBuilder<bool>(
                stream: clientRegistrationCubit
                    .baseRegistrationViewModel.outputIsConfirmPasswordHidden,
                builder: (context, hiddenState) {
                  return TextFormField(
                    onChanged: (confirmPassword) => clientRegistrationCubit
                        .baseRegistrationViewModel
                        .setConfirmPassword(confirmPassword),
                    obscureText: hiddenState.data ?? true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            clientRegistrationCubit.baseRegistrationViewModel
                                .changeConfirmPasswordState();
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
          stream: clientRegistrationCubit
              .baseRegistrationViewModel.outputIsConfirmPasswordValid,
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

  Widget nameWidget(ClientRegistrationCubit cubit) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: StreamBuilder<bool>(
                stream: cubit.baseRegistrationViewModel.outputIsFirstNameValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (firstName) =>
                        cubit.baseRegistrationViewModel.setFirstName(firstName),
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
                stream: cubit.baseRegistrationViewModel.outputIsLastNameValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (lastName) =>
                        cubit.baseRegistrationViewModel.setLastName(lastName),
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

  Widget dateOfBirthWidget(
      ClientRegistrationCubit cubit, BuildContext context) {
    DateTime? pickedDate;
    return StreamBuilder<bool>(
        stream: cubit.baseRegistrationViewModel.outputIsBirthDayValid,
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
              cubit.baseRegistrationViewModel
                  .setBirthDate(pickedDate ?? DateTime(0));
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

  Widget genderWidget(ClientRegistrationCubit cubit, BuildContext context) {
    return StreamBuilder<bool>(
        stream: cubit.baseRegistrationViewModel.outputIsGenderManValid,
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => cubit.baseRegistrationViewModel.setGender(true),
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
                onTap: () => cubit.baseRegistrationViewModel.setGender(false),
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
