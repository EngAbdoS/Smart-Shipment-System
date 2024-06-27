import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/chat/viewModel/ChatBotViewModel.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/chatField.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/chatingWidget.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/messagesList.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/robotWidget.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

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
