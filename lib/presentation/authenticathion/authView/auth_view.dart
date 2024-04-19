import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primary,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.whoAreYou,
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          const SizedBox(
            height: AppSize.s20 * 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              roleButton(
                  ImageAssets.delivery,
                  () => GoRouter.of(context).push(Routes.clientRegistrationViewRoute),
                      //GoRouter.of(context).push(Routes.deliveryAuthViewRoute),
                  context,
                  AppStrings.delivery),
              roleButton(
                  ImageAssets.client,
                  () =>  GoRouter.of(context).push(Routes.deliveryRegistrationViewRoute),
                      //GoRouter.of(context).push(Routes.clientAuthViewRoute),
                  context,
                  AppStrings.client),
            ],
          ),
        ],
      ),
    );
  }

  Widget roleButton(String asset, GestureTapCallback roleRoute,
      BuildContext context, String role) {
    return GestureDetector(
      onTap: roleRoute,
      child: Column(
        children: [
          Container(
              width: AppSize.s100 * 1.25,
              height: AppSize.s100 * 1.25,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: ColorManager.offWhite),
              child: CircleAvatar(
                  child: Image.asset(
                asset,
                fit: BoxFit.cover,
              ))
              // SvgPicture.asset(
              //   asset,
              //   fit: BoxFit.fill,
              //   excludeFromSemantics: true,
              // ),
              ),
          const SizedBox(
            height: AppSize.s12 * 2,
          ),
          Text(
            role,
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
        ],
      ),
    );
  }
}
