import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/viewModel/deliveryRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/authWidgets.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/registrationSlider.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/cirular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTripInputWidget.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

import '../../../resources/values_manager.dart';

class DeliveryExternalRegistrationView extends StatelessWidget {
  DeliveryExternalRegistrationView({super.key});

  final DeliveryRegistrationViewModel _viewModel =
      instance<DeliveryRegistrationViewModel>();

  // final TextEditingController _fromLocationTextEditingController =
  //     TextEditingController();
  // final TextEditingController _toLocationTextEditingController =
  //     TextEditingController();
  // final TextEditingController _startTimeLocationTextEditingController =
  //     TextEditingController();
  // final TextEditingController _expectedDurationTextEditingController =
  //     TextEditingController();
  // final TextEditingController _tripDetailsTextEditingController =
  //     TextEditingController();
  // final TextEditingController _tripDaysLocationTextEditingController =
  //     TextEditingController();

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
              SizedBox(
                height: 15.sp,
              ),
              DeliveryTripInputWidget(
                viewModel: _viewModel,
                // setNewDeliveryTrip: _viewModel.setNewDeliveryTrip,
                // setCurrentFromLocationAndGov:
                //     _viewModel.setCurrentFromLocationAndGov,
                // setCurrentToLocationAndGov:
                //     _viewModel.setCurrentToLocationAndGov,
                // setCurrentTripDetails:
                //     _viewModel.setCurrentTripDetails,
                // setCurrentTripExpectedDuration:
                //     _viewModel.setCurrentTripExpectedDuration,
                // setCurrentTripStartTime: _viewModel.setCurrentTripStartTime,
                // outputFromLocation: _viewModel.outputCurrentFromLocation,
                // outputToLocation: _viewModel.outputCurrentToLocation,
                // outputStartTime: _viewModel.outputCurrentTripStartTime,
                // outputExpectedDuration:
                //     _viewModel.outputCurrentTripExpectedDuration,
                // outputTripDetails: _viewModel.outputIsCurrentTripDetails,
                // // fromLocationTextEditingController:
                // //     _fromLocationTextEditingController,
                // // toLocationTextEditingController:
                // //     _toLocationTextEditingController,
                // // expectedDurationTextEditingController:
                // //     _expectedDurationTextEditingController,
                // // tripDaysTextEditingController:
                // //     _tripDaysLocationTextEditingController,
                // // tripDetailsTextEditingController:
                // //     _tripDetailsTextEditingController,
                // // startTimeLocationTextEditingController:
                // //     _startTimeLocationTextEditingController,
                // setCurrentTripNewDay: _viewModel.setCurrentTripNewDay,
                // setCurrentDeliveryIsTripOneTime:
                //     _viewModel.setCurrentDeliveryIsTripOneTime,
                // outputTripDaysList: _viewModel.outputCurrentTripDays,
                // outputCurrentDeliveryIsTripOneTime:
                //     _viewModel.outputCurrentDeliveryIsTripOneTime,
                // setCurrentTripDay: _viewModel.setCurrentTripDay,
                // outputIsDeliveryTripValid: _viewModel.outputIsDeliveryTripValid,
              ),

              SizedBox(
                height: 15.sp,
              ),

              RegularButton(
                buttonAction: () => _viewModel.login(context),
                buttonWidget: Text(
                  AppStrings.createAcc,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
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
