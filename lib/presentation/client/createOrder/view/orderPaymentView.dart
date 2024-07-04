import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/registrationSlider.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/viewModel/paymentViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

class OrderPaymentView extends StatelessWidget {
  OrderPaymentView({super.key});

  final PaymentViewModel payment = instance<PaymentViewModel>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 84.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.add_shipment,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr().animate(delay: 300.milliseconds).fade(
                    duration: 300.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut),
                const RegistrationSlider(pageIndex: 3),
                SizedBox(height: 25.h),
                RegularButton(
                  buttonWidget: Text(
                    AppStrings.pay_now,
                    style: Theme.of(context).textTheme.titleMedium,
                  ).tr(),
                  buttonAction: () async => makePayment(context),
                ),
                SizedBox(height: 25.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future makePayment(BuildContext context) async {
    await payment.initPaymentSheet(context);
    await Stripe.instance.presentPaymentSheet();
  }
}
