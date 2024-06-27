import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/domain/models/message.dart';
import 'package:smart_shipment_system/presentation/chat/viewModel/ChatBotViewModel.dart';
import 'package:smart_shipment_system/presentation/chat/widgets/messageWidget.dart';

Widget messagesList(BuildContext context, ChatBotViewModel viewModel) {
  return StreamBuilder<List<Message>?>(
      stream: viewModel.outputMessageList,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.only(left: 20.w,right: 20.w,top:(snapshot.data?.length ?? 0)>5? 230.h:500.h),
          child: ListView.builder(

              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return messageWidget(context, snapshot.data![index], viewModel)
                    .animate(
                        delay: snapshot.data![index].isLoading
                            ? 600.milliseconds
                            : 100.milliseconds)
                    .slideX(
                        begin:snapshot.data![index].isLoading
                            ? 1.1:0.5,
                        end: 0.0,
                        duration: 300.milliseconds,
                        curve: Curves.fastEaseInToSlowEaseOut);
              }),
        );
      });
}
