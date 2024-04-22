import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/viewModel/deliveryRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/authWidgets.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/registrationSlider.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/cirular_button.dart';

import '../../../resources/values_manager.dart';

class DeliveryRegistrationView1 extends StatelessWidget {
  DeliveryRegistrationView1({super.key});

  final DeliveryRegistrationViewModel _viewModel =
      instance<DeliveryRegistrationViewModel>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //
  final TextEditingController _birthDateController = TextEditingController();

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
              // SizedBox(
              //   height: 6.sp,
              // ),
              Text(
                AppStrings.createAcc,
                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),
              // SizedBox(
              //   height: 6.sp,
              // ),
              const RegistrationSlider(pageIndex: 1),

              nameInputWidget(_viewModel.outputIsFirstNameValid,
                  _viewModel.setFirstName, _nameController),
              SizedBox(
                height: 15.sp,
              ),
              nationalIdInputWidget(_viewModel.outputIsNationalIdValid,
                  _viewModel.setNationalId, _nationalIdController),
              SizedBox(
                height: 15.sp,
              ),
              phoneNumberInputWidget(_viewModel.outputIsPhoneNumberValid,
                  _viewModel.setPhoneNumber, _phoneNumberController),
              SizedBox(
                height: 15.sp,
              ),
              addressInputWidget(_viewModel.outputIsAddressValid,
                  _viewModel.setAddress, _addressController),
              SizedBox(
                height: 15.sp,
              ),
              dateOfBirthInputWidget(context, _viewModel.outputIsBirthDayValid,
                  _viewModel.setBirthDate, _birthDateController),
              SizedBox(
                height: 15.sp,
              ),
              genderWidget(context, _viewModel.outputIsGenderManValid,
                  _viewModel.setGender),
              SizedBox(
                height: 15.sp,
              ),
              signInWidget(context),
              SizedBox(
                height: 15.sp,
              ),
              nextRegistrationPage(context,_viewModel.nextPage,1),

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
