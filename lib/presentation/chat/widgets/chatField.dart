import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/chat/viewModel/ChatBotViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget chatField(BuildContext context, ChatBotViewModel viewModel) {
  final TextEditingController messageController = TextEditingController();
  final focusNode = FocusNode();

  return Container(
    alignment: Alignment.topCenter,
    height: 150,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: ColorManager.primary,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
    ),
    child: TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: (message) => {
        focusNode.unfocus(),
        viewModel.sendMessage(context, message.trim()),
        messageController.text = '',
      },
      keyboardType: TextInputType.name,
      controller: messageController,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.black, width: 1.5),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white, width: 1.5),
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        prefixIcon: IconButton(
          icon: const Icon(
            Icons.send_rounded,
            weight: 100,
            color: ColorManager.black,
          ),
          onPressed: () => {
            focusNode.unfocus(),
            viewModel.sendMessage(context, messageController.text.trim()),
            messageController.text = '',
          },
        ),
        hintText: AppStrings.message_hint.tr(),
        hintStyle: TextStyle(
            color: ColorManager.black.withOpacity(
              0.8,
            ),
            fontSize: 12),
      ),
    ),
  );
}
