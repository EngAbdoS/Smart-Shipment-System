import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/forgetPassword/viewModel/forgetPasswordViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/authWidgets.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final ForgotPasswordViewModel _viewModel =
      instance<ForgotPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 70.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.forgetPassword,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr().animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              SizedBox(
                height: 60.h,
              ),
              Image.asset(ImageAssets.forgetPassword).animate().shake(
                  duration: 200.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              SizedBox(
                height: 24.h,
              ),
              Text(
                AppStrings.emailAssociated,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr().animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              SizedBox(
                height: 24.h,
              ),

              emailInputWidget(
                      _viewModel.outputIsEmailValid, _viewModel.setEmail)
                  .animate()
                  .slideX(begin: 0.25, end: 0.0, curve: Curves.easeOut),
              SizedBox(
                height: 24.h,
              ),
              RegularButton(
                buttonAction: () => (_viewModel.isEmailValid())
                    ? _viewModel.forgotPassword(context)
                    : toastWidget(AppStrings.validateDeliveryTripInputToast),
                buttonWidget: Text(
                  AppStrings.reset,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ).animate().slideX(begin: -0.25, end: 0.0, curve: Curves.easeOut),
            ],
          ),
        ),
      ),
    );
  }
}
