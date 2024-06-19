import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/activeShipmentCard.dart';
import 'package:smart_shipment_system/presentation/client/widgets/detailedShipmentCard.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget shipmentList(
    {required BuildContext context,
    required ClientHomeViewModel viewModel,
    bool isDetailedCard = false,
    required bool isActiveShipmentList}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      !isDetailedCard
          ? Padding(
              padding: const EdgeInsets.only(right: 16, left: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.active_shipments,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: ColorManager.black,
                          fontSize: 14,
                        ),
                  ).tr(),
                  TextButton(
                    onPressed: () => viewModel.seeMore(),
                    child: Text(
                      AppStrings.see_more,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorManager.black),
                    ).tr(),
                  )
                ],
              ),
            )
          : Container(),
      Container(
        color: ColorManager.offWhite,
        child: StreamBuilder<List<ShipmentModel>?>(
            stream: viewModel.outputShipmentList,
            builder: (context, snapshot) {
              print(snapshot.data);
              print("snapshot.data");
              return (snapshot.hasData && snapshot.data!.length> 0)
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return isActiveShipmentList
                            ? (!isDetailedCard)
                                ? activeShipmentCard(context,
                            snapshot.data![index])
                                : detailedShipmentCard(context,
                            snapshot.data![index])
                            : detailedShipmentCard(context,
                            snapshot.data![index]);
                      })
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SvgPicture.asset(
                        SVGAssets.noData,
                        height: 200,
                      ),
                    );
            }),
      ),
      const SizedBox(
        height: 60,
      )
    ],
  );
}
