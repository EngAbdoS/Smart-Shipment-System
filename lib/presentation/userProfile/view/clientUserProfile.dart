import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/userProfile/viewModel/userProfileViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/faverSettingSection.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/mainSettingSection.dart';
import 'package:smart_shipment_system/presentation/userProfile/widgets/settingSection.dart';
import '../widgets/generalSettingSection.dart';

class ClientUserProfileView extends StatefulWidget {
  const ClientUserProfileView({
    super.key,
  });

  @override
  State<ClientUserProfileView> createState() => _ClientUserProfileViewState();
}

class _ClientUserProfileViewState extends State<ClientUserProfileView> {
  final bool isClientOrDelivery = true;

  final MainClientViewModel mainViewModel = instance<MainClientViewModel>();

  final UserProfileViewModel _viewModel = instance<UserProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.offWhite,
      height: double.maxFinite,
      width: double.maxFinite,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 70.h, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.profile_settings,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr().animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
                 settingSection(mainSettingSection(context, _viewModel.userProfileData)),
              settingSection(generalSettingSection(
                  context, isClientOrDelivery, _viewModel, mainViewModel)),
               settingSection(
                   faverSettingSection(context, isClientOrDelivery, _viewModel)),
            ],
          ),
        ),
      ),
    );
  }
}
