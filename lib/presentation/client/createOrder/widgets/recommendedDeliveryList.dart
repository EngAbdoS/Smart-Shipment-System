import 'package:flutter/cupertino.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/widgets/recommendedDeliveryCard.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/emptyListWidget.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget recommendedDeliveryList(BuildContext context,
    Stream<List<RecommendedDeliveryEntity>?> deliveryList) {
  return StreamBuilder<List<RecommendedDeliveryEntity>?>(
      stream: deliveryList,
      builder: (context, snapshot) {
        return snapshot.hasData && snapshot.data!.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return recommendedDeliveryCard(
                      context, snapshot.data![index]) .animate()
                      .slideY(duration: 300.milliseconds, curve: Curves.bounceInOut);
                }).animate().shake(curve: Curves.bounceInOut)
            : emptyListWidget(context,
                message: AppStrings.no_recommended_delivery).animate().shake(curve: Curves.bounceInOut);
      });
}
