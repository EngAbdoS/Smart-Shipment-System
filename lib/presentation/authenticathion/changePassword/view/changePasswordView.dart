import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/changePassword/viewModel/changePasswordViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/authWidgets.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});

  final ChangePasswordViewModel _viewModel =
      instance<ChangePasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p18, vertical: AppPadding.p20 * 3.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.changePassword,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr().animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              SizedBox(
                height: 60.h,
              ),
              Image.asset(ImageAssets.changePassword).animate().shake(
                  duration: 200.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              SizedBox(
                height: 24.h,
              ),
              Text(
                AppStrings.passwordDifferent,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ).tr().animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              SizedBox(
                height: 24.h,
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
                      _viewModel.changeConfirmPasswordState)
                  .animate()
                  .slideX(begin: 0.25, end: 0.0, curve: Curves.easeOut),
              SizedBox(
                height: 24.h,
              ),
              RegularButton(
                buttonAction: () => (_viewModel.isConfirmPasswordValid())
                    ? _viewModel.changePassword(context)
                    : toastWidget(AppStrings.validateDeliveryTripInputToast),
                buttonWidget: Text(
                  AppStrings.save,
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
