import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

class DeliveryAuthView extends StatelessWidget {
  const DeliveryAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              SVGAssets.authIll,
              color: ColorManager.primary,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: AppPadding.p20 * 7.5, left: AppPadding.p20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.helloDelivery,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).tr(),
                  Text(
                    AppStrings.happyDelivery,
                    style: Theme.of(context).textTheme.titleSmall,
                  ).tr(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.75),
              child: Image.asset(
                ImageAssets.deliveryBike,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20, vertical: AppPadding.p20 * 8.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RegularButton(
                    buttonAction: () =>GoRouter.of(context).push(Routes.loginViewRoute),
                    buttonWidget: Text(
                      AppStrings.signIn,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.white),
                    ).tr(),
                    buttonColor: ColorManager.black,
                    shadowColor: ColorManager.noColor,
                  ),
                  const SizedBox(
                    height: AppSize.s18,
                  ),
                  RegularButton(
                    buttonAction: () {},
                    buttonWidget: Text(
                      AppStrings.signUn,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.white),
                    ).tr(),
                    buttonColor: ColorManager.black,
                    shadowColor: ColorManager.noColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
