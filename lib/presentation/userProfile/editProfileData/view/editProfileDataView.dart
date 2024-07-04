import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/userProfile/editProfileData/viewModel/editProfileDataViewModel.dart';
import 'package:smart_shipment_system/presentation/userProfile/editProfileData/widgets.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final EditUserProfileViewModel _viewModel =
      instance<EditUserProfileViewModel>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                AppStrings.edit_profile,
                style: Theme.of(context).textTheme.titleMedium,
              ).tr().animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              userEditProfileImage(
                  context,
                  _viewModel.setProfilePicture,
                  _viewModel.outputProfileImageStream,
                  _viewModel.outputIsProfileImageEditingStream),
              SizedBox(height: 20.h),
              nameEditInputWidget(context, _viewModel.outputNameStream,
                  _viewModel.setName, _viewModel.isNameValid),
              SizedBox(height: 20.h),
              emailEditInputWidget(context, _viewModel.outputEmailStream,
                  _viewModel.setEmail, _viewModel.isEmailValid),
              SizedBox(height: 20.h),
              phoneNumberEditInputWidget(context, _viewModel.outputPhoneStream,
                  _viewModel.setPhone, _viewModel.isPhoneNumberValid),
              SizedBox(height: 20.h),
              RegularButton(
                buttonAction: () => (_viewModel.isAllEditedDataValid())
                    ? _viewModel.editProfileData(context)
                    : toastWidget(AppStrings.validateDeliveryTripInputToast),
                buttonWidget: Text(
                  AppStrings.confirm_shipment,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ).animate(delay: 700.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
            ].animate(delay: 500.ms, interval: 300.ms)
                .fade(duration: 200.ms),
          ),
        ),
      ),
    );
  }
}
