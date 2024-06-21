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
              child: StreamBuilder<bool?>(
                  stream: viewModel.outputIsHomeActiveShipmentOrSearchStream,
                  builder: (context, snapshot) {
                    return (snapshot.data ?? true)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.active_shipments,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: ColorManager.black,
                                      fontSize: 14,
                                    ),
                              ).tr(),
                              StreamBuilder<List<ShipmentModel>?>(
                                  stream: viewModel.outputShipmentList,
                                  builder: (context, snapshot) {
                                    //  print(snapshot.data?.length??"7");
                                    return TextButton(
                                      onPressed: () => viewModel
                                          .seeMore(snapshot.data?.length ?? 0),
                                      child: Text(
                                        (snapshot.data?.length ?? 0) <= 3
                                            ? AppStrings.see_more
                                            : AppStrings.see_less,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: ColorManager.black),
                                      ).tr(),
                                    );
                                  })
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Text(
                                  AppStrings.search_result,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        color: ColorManager.black,
                                        fontSize: 14,
                                      ),
                                ).tr(),
                                const Icon(
                                  Icons.manage_search,
                                  color: ColorManager.primary,
                                )
                              ]);
                  }),
            )
          : Container(),
      Container(
        color: ColorManager.offWhite,
        child: StreamBuilder<List<ShipmentModel>?>(
            stream: viewModel.outputShipmentList,
            builder: (context, snapshot) {
              return (snapshot.hasData && snapshot.data!.isNotEmpty)
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return isActiveShipmentList
                            ? (!isDetailedCard)
                                ? activeShipmentCard(
                                    context, snapshot.data![index])
                                : detailedShipmentCard(
                                    context, snapshot.data![index])
                            : detailedShipmentCard(
                                context, snapshot.data![index]);
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
