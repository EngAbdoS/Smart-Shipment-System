
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/domain/models/deliveryTripModel.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTrip/deliveryTripWidget.dart';

Widget deliveryAddedTripList(
    BuildContext context,
    Stream<List<DeliveryTripModel>> outputDeliveryTripList,
    Function deleteTrip) {
  return StreamBuilder<List<DeliveryTripModel>>(
      stream: outputDeliveryTripList,
      builder: (context, snapshot) {
        return Container(
          // height: 200,
          padding: EdgeInsets.only(bottom: 25.sp),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => deliveryTripWidget(
                context, snapshot.data![index], index, deleteTrip)
                .animate()
                .slideY(duration: 300.milliseconds, curve: Curves.bounceInOut),
            itemCount: snapshot.data?.length ?? 0,
          ).animate().shake(curve: Curves.bounceInOut),
        );
      });
}
