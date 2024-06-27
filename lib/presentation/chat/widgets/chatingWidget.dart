import 'package:flutter/cupertino.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/chatField.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/messagesList.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/chat/viewModel/ChatBotViewModel.dart';

Widget chattingWidget(BuildContext context, ChatBotViewModel viewModel) {
  return Container(
    color: ColorManager.primary,
    height: double.maxFinite,
    width: double.maxFinite,
    child: SingleChildScrollView(
      reverse: true,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
            // top: 70.h,
            ),
        child: Container(

          color: ColorManager.offWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              messagesList(context, viewModel),
              chatField(context, viewModel),
            ],
          ),
        ),
      ),
    ),
  );
}
