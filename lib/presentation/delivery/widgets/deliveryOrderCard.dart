import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/domain/entities/deliveryOrderIntity.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentCardId.dart';
import 'package:smart_shipment_system/presentation/delivery/widgets/orderCardStatusButton.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import '../../client/widgets/shipmentStatusWidget.dart';

Widget deliveryOrderCard(
    BuildContext context, DeliveryOrderEntity order, Function changeStatus) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray.withOpacity(0.15),
            blurRadius: 25,
            offset: const Offset(2, 8),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shipmentStatusWidget(context, order.status),
              orderCardStatusButton(
                  context, order.status, order.orderId, changeStatus),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: ColorManager.black,
            thickness: 1,
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text("${AppStrings.recipient_name.tr()} ",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorManager.primary))
                  .tr(),
              shipmentCardId(context, order.reciptiontName),
            ],
          ),
          Row(
            children: [
              Text("${AppStrings.recipient_phone.tr()} ",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorManager.primary))
                  .tr(),
              shipmentCardId(context, order.reciptiontPhone),
            ],
          ),
          Row(
            children: [
              Text("${AppStrings.order_id.tr()} ",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorManager.primary))
                  .tr(),
              shipmentCardId(context, order.orderId),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const DottedLine(
            dashColor: ColorManager.black,
            dashGapLength: 2,
            dashLength: 2,
            dashGapRadius: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      AppStrings.shipment_type,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12, color: ColorManager.primary),
                    ).tr(),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      order.type,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 10),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      AppStrings.weight,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12, color: ColorManager.primary),
                    ).tr(),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      order.weight,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 10),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      AppStrings.things_count,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12,
                            color: ColorManager.primary,
                          ),
                    ).tr(),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      order.quantity.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 10),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const DottedLine(
            dashColor: ColorManager.black,
            dashGapLength: 2,
            dashLength: 2,
            dashGapRadius: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          Text("${AppStrings.shipment_description.tr()}\n ",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorManager.primary)),
          Flexible(
            child: Text(order.description,
                style: Theme.of(context).textTheme.titleSmall),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}
