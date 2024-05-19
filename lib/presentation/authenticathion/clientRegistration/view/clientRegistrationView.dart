import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/clientRegistration/viewModel/clientRegistrationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/authWidgets.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

class ClientRegistrationView extends StatelessWidget {
  ClientRegistrationView({super.key});

  final ClientRegistrationViewModel _viewModel =
      instance<ClientRegistrationViewModel>();

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
              SizedBox(
                height: 15.sp,
              ),
              nameInputWidget(
                  _viewModel.outputIsFirstNameValid, _viewModel.setFirstName),
              SizedBox(
                height: 15.sp,
              ),
              phoneNumberInputWidget(_viewModel.outputIsPhoneNumberValid,
                  _viewModel.setPhoneNumber),
              SizedBox(
                height: 15.sp,
              ),
              emailInputWidget(
                  _viewModel.outputIsEmailValid, _viewModel.setEmail),
              SizedBox(
                height: 15.sp,
              ),
              passwordWidgets(
                  _viewModel.outputIsPasswordValid,
                  _viewModel.outputIsConfirmPasswordValid,
                  _viewModel.outputIsPasswordHidden,
                  _viewModel.outputIsConfirmPasswordHidden,
                  _viewModel.setPassword,
                  _viewModel.setConfirmPassword,
                  _viewModel.validateConfirmPassword,
                  _viewModel.changePasswordState,
                  _viewModel.changeConfirmPasswordState),
              SizedBox(
                height: 30.sp,
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
            ].animate(interval: 300.ms).fade(duration: 300.ms),
          ),
        ),
      ),
    );
  }
}
