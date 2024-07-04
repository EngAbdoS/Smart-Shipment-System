import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/chat/viewModel/ChatBotViewModel.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/chatingWidget.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/robotWidget.dart';

class ChatBotView extends StatefulWidget {
  const ChatBotView({super.key});

  @override
  State<ChatBotView> createState() => _ChatBotViewState();
}

class _ChatBotViewState extends State<ChatBotView> {
  final ChatBotViewModel viewModel = instance<ChatBotViewModel>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        chattingWidget(context, viewModel),
        robotWidget(context),
      ],
    );
  }
}
