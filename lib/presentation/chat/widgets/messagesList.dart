import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/domain/models/message.dart';
import 'package:smart_shipment_system/presentation/chat/viewModel/ChatBotViewModel.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/messageWidget.dart';

Widget messagesList(BuildContext context, ChatBotViewModel viewModel) {
  return StreamBuilder<List<Message>?>(
      stream: viewModel.outputMessageList,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return messageWidget(context, snapshot.data![index], viewModel);
              }),
        );
      });
}
