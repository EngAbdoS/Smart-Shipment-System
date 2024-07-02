import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/domain/entities/deliveryOrderIntity.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/presentation/delivery/widgets/deliveryOrderCard.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/emptyListWidget.dart';

Widget deliveryOrdersList({
  required BuildContext context,
  required Stream<List<DeliveryOrderEntity>?> outputDeliveryOrdersList,
  required Function assignOrderToMe,
  required ScrollController scrollController,
}) {
  return StreamBuilder<List<DeliveryOrderEntity>?>(
    stream: outputDeliveryOrdersList,
    builder: (context, snapshot) {
      return Container(
        // height: 200,
        padding: EdgeInsets.only(bottom: 25.sp),
        child: (snapshot.hasData && snapshot.data!.isNotEmpty)
            ? ListView.builder(
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    deliveryOrderCard(snapshot.data![index]).animate().slideY(
                        duration: 300.milliseconds, curve: Curves.bounceInOut),
                itemCount: snapshot.data?.length ?? 0,
              ).animate().shake(curve: Curves.bounceInOut)
            : emptyListWidget(
                context,
                message: AppStrings.on_data,
              ),
      );
    },
  );
}
