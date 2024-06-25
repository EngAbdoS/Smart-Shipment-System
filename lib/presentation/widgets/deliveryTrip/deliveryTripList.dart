import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTrip/deliveryTripEntityWidget.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTrip/deliveryTripWidget.dart';

Widget deliveryTripList(
    BuildContext context,
    Stream<List<DeliveryTripEntity>> outputDeliveryTripList,
    Function deleteTrip) {
  return StreamBuilder<List<DeliveryTripEntity>>(
      stream: outputDeliveryTripList,
      builder: (context, snapshot) {


        print( snapshot.data?.length??0);
        print( snapshot.data?[0].startState??0);

        return Container(
          // height: 200,
          padding: EdgeInsets.only(bottom: 25.sp),
          child: (snapshot.hasData && snapshot.data!.isNotEmpty)
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => deliveryTripEntityWidget(
                          context, snapshot.data![index], index, deleteTrip)
                      .animate()
                      .slideY(
                          duration: 300.milliseconds,
                          curve: Curves.bounceInOut),
                  itemCount: snapshot.data?.length ?? 0,
                ).animate().shake(curve: Curves.bounceInOut)
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SvgPicture.asset(
                    SVGAssets.noData,
                    height: 200,
                  ),
                ),
        );
      });
}
