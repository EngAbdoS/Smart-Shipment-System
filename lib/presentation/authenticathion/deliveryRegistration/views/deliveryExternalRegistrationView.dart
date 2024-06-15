import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/viewModel/deliveryRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/registrationSlider.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTripInputWidget.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';
import '../../../resources/values_manager.dart';

class DeliveryExternalRegistrationView extends StatelessWidget {
  DeliveryExternalRegistrationView({super.key});

  final DeliveryRegistrationViewModel _viewModel =
      instance<DeliveryRegistrationViewModel>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mainDeliveryRegistrationWidget(context));
  }

  SingleChildScrollView mainDeliveryRegistrationWidget(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              authLogoWidget(),

              const RegistrationSlider(pageIndex: 3),
              deliveryAddedTripList(context, _viewModel.outputDeliveryTripList,
                  _viewModel.deleteTrip),
              DeliveryTripInputWidget(
                viewModel: _viewModel,
              ).animate().scaleXY(
                  begin: 0.5, end: 1.0, curve: Curves.fastEaseInToSlowEaseOut),

              SizedBox(
                height: 15.sp,
              ),

              RegularButton(
                buttonAction: () => (_viewModel.fixedDeliveryValidation())
                    ? _viewModel.registerFixedDelivery(context)
                    : toastWidget(AppStrings.validateDeliveryTripInputToast),
                buttonWidget: Text(
                  AppStrings.createAcc,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ).animate(delay: 600.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              //nextRegistrationPage(context, _viewModel.navigateToNextPage, 2),

              SizedBox(
                height: 15.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
