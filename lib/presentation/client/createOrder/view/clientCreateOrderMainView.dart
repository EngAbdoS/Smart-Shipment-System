import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/registrationSlider.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/viewModel/clientCreateOrderViewModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentWidgets.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/inputLocationWidget.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

import '../../../resources/values_manager.dart';

class ClientCreateOrderMainView extends StatelessWidget {
  ClientCreateOrderMainView({super.key});

  final ClientCreateOrderViewModel _viewModel =
      instance<ClientCreateOrderViewModel>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mainDeliveryRegistrationWidget(context));
  }

  SingleChildScrollView mainDeliveryRegistrationWidget(BuildContext context) {
    return SingleChildScrollView(
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
              const RegistrationSlider(pageIndex: 1),
              SizedBox(height: 25.h),
              Column(children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationWidget(),
                    SizedBox(
                      width: 6.w,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          inputLocationWidget(
                              context,
                              _viewModel.setCurrentFromLocationAndGov,
                              AppStrings.shipping_address,
                              AppStrings.locationMassage,
                              AppStrings.delivery_address_details),
                          SizedBox(height: 25.h),
                          inputLocationWidget(
                              context,
                              _viewModel.setCurrentToLocationAndGov,
                              AppStrings.delivery_address,
                              AppStrings.locationMassage,
                              AppStrings.recipient_address),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
              SizedBox(height: 25.h),
              shipmentWeightInputWidget(
                  _viewModel.outputIsWeightValid, _viewModel.setShipmentWeight),
              SizedBox(height: 25.h),
              shipmentTypeInputWidget(_viewModel.outputIsShipmentTypeValid,
                  _viewModel.setShipmentType),
              SizedBox(height: 25.h),
              recipientNameInputWidget(_viewModel.outputIsRecipientNameValid,
                  _viewModel.setRecipientName),
              SizedBox(height: 25.h),
              recipientPhoneNumberInputWidget(
                  _viewModel.outputRecipientPhoneValid,
                  _viewModel.setRecipientPhone),
              SizedBox(height: 25.h),
              RegularButton(
                buttonAction: () => (_viewModel.isAllShipmentDataValid())
                    ? _viewModel.addShipment(context)
                    : toastWidget(AppStrings.validateDeliveryTripInputToast),
                buttonWidget: Text(
                  AppStrings.confirm_shipment,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ).animate(delay: 600.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
            ],
          ),
        ),
      ),
    );
  }
}
