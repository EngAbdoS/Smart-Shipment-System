import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/userProfile/viewModel/clientUserProfileViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/language_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

class ClientUserProfileView extends StatefulWidget {
  const ClientUserProfileView({super.key});

  @override
  State<ClientUserProfileView> createState() => _ClientUserProfileViewState();
}

class _ClientUserProfileViewState extends State<ClientUserProfileView> {
  final ClientUserProfileViewModel _viewModel =
      instance<ClientUserProfileViewModel>();

  // final MainClientViewModel _mainClientViewMode = instance<MainClientViewModel>();

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
              settingSection(mainSettingSection()),
              settingSection(generalSettingSection()),
              settingSection(faverSettingSection()),
            ],
          ),
        ),
      ),
    );
  }

  Widget generalSettingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            AppStrings.general,
            style: Theme.of(context).textTheme.headlineMedium,
          ).tr(),
        ),
        generalSetting(
          () {},
          AppStrings.edit_profile,
          AppStrings.profile_edits,
          Icons.edit,
        ),
        generalSetting(
          () => _viewModel.forgotPassword(context),
          AppStrings.changePassword,
          AppStrings.profile_safety,
          Icons.lock,
        ),
        generalSetting(
          () {},
          AppStrings.my_locations,
          AppStrings.profile_safety,
          Icons.location_on,
        ),
        generalSetting(
          () {},
          AppStrings.add_card,
          AppStrings.add_card_method,
          Icons.credit_card_rounded,
        ),
      ],
    );
  }

  Widget generalSetting(
      GestureTapCallback onTap, String title, String hint, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: ColorManager.lightGray.withOpacity(0.3),
                  shape: BoxShape.circle),
              child: Icon(
                icon,
                color: ColorManager.primary,
              ),
            ),
            SizedBox(
              width: 14.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: ColorManager.black,
                        fontSize: 17,
                      ),
                ).tr(),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  hint,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.gray,
                        fontSize: 8,
                      ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ).tr(),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: ColorManager.gray,
            ),
          ],
        ),
      ),
    );
  }

  Widget faverSetting(
      Widget sectionWidget, String title, String hint, IconData icon) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: ColorManager.lightGray.withOpacity(0.3),
                shape: BoxShape.circle),
            child: Icon(
              icon,
              color: ColorManager.primary,
            ),
          ),
          SizedBox(
            width: 14.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: ColorManager.black, fontSize: 17))
                  .tr(),
              SizedBox(
                height: 5.h,
              ),
              Text(
                hint,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: ColorManager.gray, fontSize: 8),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ).tr(),
            ],
          ),
          const Spacer(),
          sectionWidget,
        ],
      ),
    );
  }

  Widget faverSettingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            AppStrings.faves,
            style: Theme.of(context).textTheme.headlineMedium,
          ).tr(),
        ),
        faverSetting(
            notificationSwitch(_viewModel.changeNotificationSwitch,
                _viewModel.outputNotificationSwitchStream),
            AppStrings.notifications,
            AppStrings.edit_notifications,
            Icons.notifications),
        faverSetting(changeLanguage(), AppStrings.language,
            AppStrings.choose_language, Icons.language),
        generalSetting(
            ratingWidget, AppStrings.rate, AppStrings.how_rate, Icons.star),
        logoutWidget(),
      ],
    );
  }

  ratingWidget() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          AppStrings.rate,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: ColorManager.primary),
        ).tr(),
        content: AnimatedRatingStars(
          initialRating: 3.5,
          minRating: 0.0,
          maxRating: 5.0,
          filledColor: Colors.amber,
          emptyColor: Colors.grey,
          filledIcon: Icons.star,
          halfFilledIcon: Icons.star_half,
          emptyIcon: Icons.star_border,
          onChanged: (double rating) {
            // Handle the rating change here
            print('Rating: $rating');
          },
          displayRatingValue: true,
          interactiveTooltips: true,
          customFilledIcon: Icons.star,
          customHalfFilledIcon: Icons.star_half,
          customEmptyIcon: Icons.star_border,
          starSize: 30.0,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          readOnly: false,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text(AppStrings.ok).tr(),
          ),
        ],
      ),
    );
  }

  Widget changeLanguage() {
    bool isArabic = context.locale == ARABIC_LOCAL ? true : false;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        languageWidget(isArabic, AppStrings.arabic),
        SizedBox(
          width: 5.w,
        ),
        languageWidget(!isArabic, AppStrings.english),
      ],
    );
  }

  Widget languageWidget(bool isLang, String lang) {
    return GestureDetector(
      onTap: () => isLang ? {} : _viewModel.changeLanguage(context),
      child: Container(
        width: 60.w,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isLang ? ColorManager.primary : ColorManager.white,
          border: Border.all(color: ColorManager.primary),
        ),
        child: Center(
          child: Text(
            lang,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isLang ? ColorManager.black : ColorManager.primary),
          ).tr(),
        ),
      ),
    );
  }

  Widget notificationSwitch(Function fun, Stream<bool?> outputSwitchValue) {
    return StreamBuilder<bool?>(
        stream: outputSwitchValue,
        builder: (context, snapshot) {
          return Switch(
              activeColor: ColorManager.primary,
              inactiveTrackColor: ColorManager.primary.withOpacity(0.05),
              inactiveThumbColor: ColorManager.gray,
              value: snapshot.data ?? true,
              onChanged: (value) => fun(value));
        });
  }

  Widget logoutWidget() {
    return GestureDetector(
      onTap: () => _viewModel.logout(context),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: ColorManager.lightGray.withOpacity(0.3),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.logout,
                color: ColorManager.primary,
              ),
            ),
            SizedBox(
              width: 14.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.logout,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ColorManager.primary, fontSize: 17))
                    .tr(),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  AppStrings.safe_logout,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.gray, fontSize: 8),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ).tr(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget settingSection(Widget section) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: section,
      ),
    );
  }

  Widget mainSettingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StudentProfileCirclerImage(
          imageUrl: _viewModel.userProfileData.email,
          navigate: () {},
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _viewModel.userProfileData.userName,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: ColorManager.black, fontSize: 17),
            ).tr(),
            Text(
              _viewModel.userProfileData.email,
              style: Theme.of(context).textTheme.titleSmall,
            ).tr(),
          ],
        ),
      ],
    );
  }
}
