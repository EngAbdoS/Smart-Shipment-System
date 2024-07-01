import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

import '../../../resources/values_manager.dart';

class DeliveryRegistrationView2 extends StatelessWidget {
  DeliveryRegistrationView2({super.key});

  final DeliveryRegistrationViewModel _viewModel =
      instance<DeliveryRegistrationViewModel>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
              Text(
                AppStrings.createAcc,
                style: Theme.of(context).textTheme.titleMedium,
              ).tr().animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              const RegistrationSlider(pageIndex: 2),
              Column(
                children: [
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
                    height: 15.sp,
                  ),
                  deliveryConfirmationPictureInputWidget(
                      context,
                      _viewModel.outputDeliveryConfirmationPicture,
                      _viewModel.outputIsDeliveryConfirmationPictureValid,
                      _viewModel.setDeliveryConfirmationPicture),
                  SizedBox(
                    height: 15.sp,
                  ),
                  nextRegistrationPage(
                      context, _viewModel.navigateToNextPage, 2),
                ]
                    .animate(delay: 500.ms, interval: 300.ms)
                    .fade(duration: 200.ms),
              ),
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
