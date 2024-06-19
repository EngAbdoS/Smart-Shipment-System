import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/clientAppBar.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentList.dart';

class ShipmentView extends StatelessWidget {
  ShipmentView({super.key});

  final ClientHomeViewModel _viewModel = instance<ClientHomeViewModel>();
  final MainClientViewModel mainClientViewModel =
      instance<MainClientViewModel>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        buildSliverAppBar(
            context: context,
            clientViewModel: _viewModel,
            mainClientViewModel: mainClientViewModel,
            isHome: false),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Align(
                alignment: Alignment.topCenter,
                child: shipmentList(
                  context: context,
                  viewModel: _viewModel,
                  isActiveShipmentList: false,
                  isDetailedCard: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
