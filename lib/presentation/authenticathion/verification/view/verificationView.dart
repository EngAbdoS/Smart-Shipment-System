import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/verification/viewModel/verificationViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/optWidget/otpTextWidget.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class EmailVerificationView extends StatelessWidget {
   EmailVerificationView({super.key, });

final EmailVerificationViewModel _viewModel=instance<EmailVerificationViewModel>();
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
                AppStrings.confirm,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr(),
              SizedBox(
                height: 70.h,
              ),
              Text(
                AppStrings.enterOtp,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr(),
              SizedBox(
                height: 50.h,
              ),

              VerificationCodeField(
                length: 6,
                onFilled: (value) => print(value),
                size: const Size(40, 90),
                spaceBetween: 10,
                matchingPattern: RegExp(r'^\d+$'),
              ),

              SizedBox(
                height: 50.h,
              ),

              RegularButton(
                buttonAction:_viewModel.isOTPValid()
                    ? () => _viewModel.verification(context)
                    : () => toastWidget(
                    AppStrings.validateDeliveryTripInputToast),
                buttonWidget: Text(
                  AppStrings.confirmm,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
