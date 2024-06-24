import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';

Widget recommendedDeliveryList(
    BuildContext context, List<RecommendedDeliveryEntity> deliveryList) {
  return deliveryList.isNotEmpty
      ? ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: deliveryList.length,
          itemBuilder: (context, index) {
            return recommendedDeliveryCard(deliveryList[index]);
          })
      : Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SvgPicture.asset(
            SVGAssets.noData,
            height: 200,
          ),
        );
}

Widget recommendedDeliveryCard(RecommendedDeliveryEntity delivery) {
  return Container(
    child: Text(delivery.userName),
  );
}
