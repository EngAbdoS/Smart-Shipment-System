import 'package:flutter/cupertino.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/widgets/recommendedDeliveryCard.dart';
import 'package:smart_shipment_system/presentation/widgets/emptyListWidget.dart';

Widget recommendedDeliveryList(
    BuildContext context, List<RecommendedDeliveryEntity> deliveryList) {
  return deliveryList.isNotEmpty
      ? ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: deliveryList.length,
          itemBuilder: (context, index) {
            return recommendedDeliveryCard(context,deliveryList[index]);
          })
      : emptyListWidget(context,);
}

