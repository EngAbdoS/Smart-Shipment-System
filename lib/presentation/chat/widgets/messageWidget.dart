import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/domain/models/message.dart';
import 'package:smart_shipment_system/presentation/chat/viewModel/ChatBotViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget messageWidget(
    BuildContext context, Message message, ChatBotViewModel viewModel) {
  return Padding(
    padding: EdgeInsets.only(
        top: 10, bottom: 10, left: message.isUserOrBot ? 45 : 0),
    child: Container(
      width: double.minPositive,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: message.isFailure ? ColorManager.error : ColorManager.primary,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.zero,
          )),
      child: !message.isUserOrBot
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: ColorManager.offWhite,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImageAssets.robot,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                !message.isLoading
                    ? Flexible(
                        child: Text(
                          message.message,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: ColorManager.white),
                        ).animate().blur(
                            end: Offset(0, 0),
                            begin: Offset(0.5, 0.5),
                            duration: 300.microseconds,
                            curve: Curves.fastEaseInToSlowEaseOut),
                      )
                    : Flexible(
                        child: SizedBox(
                        height: 50,
                        child: OverflowBox(
                            child: Lottie.asset(
                          height: 100,
                          JsonAssets.loadingDots,
                        )),
                      )),
              ],
            )
          : Text(
              message.message,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: ColorManager.white),
            ),
    ),
  );
}
