import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/registrationSlider.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/viewModel/clientCreateOrderViewModel.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/viewModel/paymentViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

class OrderPaymentView extends StatelessWidget {
  OrderPaymentView({super.key});

  final PaymentViewModel payment = instance<PaymentViewModel>();
  final ClientCreateOrderViewModel _viewModel =
      instance<ClientCreateOrderViewModel>();
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
                Container(
                  height: 60.h,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: ColorManager.primary,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorManager.shadowColor,
                        offset: Offset(2, 8),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${AppStrings.cost.tr()} :   ",
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(_viewModel.createdShipment?.price ?? "_",
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                )
                    .animate()
                    .slideX(begin: -0.25, end: 0.0, curve: Curves.easeOut),
                SizedBox(height: 120.h),
                RegularButton(
                  buttonWidget: Text(
                    AppStrings.pay_now,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                      .tr()
                      .animate()
                      .slideY(begin: -0.25, end: 0.0, curve: Curves.easeOut),
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
