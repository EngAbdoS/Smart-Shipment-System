import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/domain/models/message.dart';
import 'package:smart_shipment_system/presentation/chat/viewModel/ChatBotViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget messageWidget(
    BuildContext context, Message message, ChatBotViewModel viewModel) {
  return Container(
    child: Text(message.message),
  );
}
