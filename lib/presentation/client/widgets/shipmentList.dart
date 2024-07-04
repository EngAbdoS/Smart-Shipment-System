import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/activeShipmentCard.dart';
import 'package:smart_shipment_system/presentation/client/widgets/detailedShipmentCard.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/status/emptyListWidget.dart';
import 'package:smart_shipment_system/presentation/widgets/status/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/status/loadingState.dart';

Widget shipmentList(
    {required BuildContext context,
    required ClientHomeViewModel viewModel,
    required MainClientViewModel mainClientViewModel,
    bool isDetailedCard = false,
    required bool isActiveShipmentList,
    required ScrollController scrollController}) {
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
                                    return (snapshot.hasData &&
                                            snapshot.data!.isNotEmpty)
                                        ? TextButton(
                                            onPressed: () => viewModel.seeMore(
                                                snapshot.data?.length ?? 0),
                                            child: Text(
                                              (snapshot.data?.length ?? 0) <= 3
                                                  ? AppStrings.see_more
                                                  : AppStrings.see_less,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color:
                                                          ColorManager.black),
                                            ).tr(),
                                          )
                                        : Container();
                                  })
                            ],
                          ).animate().fade(
                            duration: 300.milliseconds,
                            curve: Curves.fastEaseInToSlowEaseOut)
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
            ).animate().fade(
              duration: 300.milliseconds, curve: Curves.fastEaseInToSlowEaseOut)
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
                                ? GestureDetector(
                                    onTap: !isDetailedCard
                                        ? () {
                                            loadingState(context: context);
                                            mainClientViewModel.changeWidget(
                                                context, 1);
                                            viewModel.setShipmentScrollPosition(
                                                index);
                                            hideState(context: context);
                                          }
                                        : () {},
                                    child: activeShipmentCard(
                                        context, snapshot.data![index]),
                                  )
                                : detailedShipmentCard(
                                    context,
                                    snapshot.data![index],
                                    viewModel.deleteShipment)
                            : detailedShipmentCard(
                                context,
                                snapshot.data![index],
                                viewModel.deleteShipment);
                      }).animate().shake(curve: Curves.bounceInOut)
                  : isActiveShipmentList
                      ? emptyListWidget(context,
                          message: AppStrings.on_data,
                          actionButton: () =>
                              viewModel.getActiveShipmentList(context))
                      : emptyListWidget(context,
                          message: AppStrings.on_data,
                          actionButton: () =>
                              viewModel.getDeliveredShipmentList(context));
            }),
      ),
      const SizedBox(
        height: 60,
      )
    ],
  );
}
