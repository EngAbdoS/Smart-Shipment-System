import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/activeShipmentStatusBar.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentCardId.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentStatusWidget.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget detailedShipmentCard(
    BuildContext context, ShipmentModel shipment, Function deleteShipment) {
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45.h,
                width: 45.h,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: ColorManager.lightGray.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.location_on_outlined,
                  color: ColorManager.primary,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              // Flexible(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       // Flexible(
              //       //   child: Text(
              //       //     '#${shipment.id}',
              //       //     style: Theme.of(context)
              //       //         .textTheme
              //       //         .titleSmall!
              //       //         .copyWith(fontSize: 14),
              //       //     overflow: TextOverflow.ellipsis,
              //       //     softWrap: true,
              //       //   ),
              //       // ),
              //       Text(shipment.date,
              //           style: Theme.of(context).textTheme.titleSmall),
              //     ],
              //   ),
              // ),
              shipmentStatusWidget(context, shipment.status),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          shipmentCardId(context, shipment.id),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: ColorManager.black,
            thickness: 1,
          ),
          const SizedBox(
            height: 4,
          ),
          activeShipmentStatusBar(
              context: context, shipment: shipment, withDetails: true),
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
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    AppStrings.weight,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12),
                  ).tr(),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    shipment.weight,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 10),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    AppStrings.things_count,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12),
                  ).tr(),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    shipment.quantity.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 10),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    AppStrings.delivery_cost,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12),
                  ).tr(),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    shipment.price,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 10),
                  )
                ],
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
            height: 15,
          ),
          SvgPicture.asset(SVGAssets.qr),
          const SizedBox(
            height: 15,
          ),
          Text(
            AppStrings.scan_to_accept,
            style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10),
          ).tr(),
          TextButton(
              onPressed: () => deleteShipment(context, shipment.id),
              child: Text(
                AppStrings.cancel_order,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 10,
                      decoration: TextDecoration.underline,
                    ),
              ).tr())
        ],
      ),
    ),
  );
}
