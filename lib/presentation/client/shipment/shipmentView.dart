import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/clientAppBar.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentList.dart';

class ShipmentView extends StatefulWidget {
  ShipmentView({super.key});

  @override
  State<ShipmentView> createState() => _ShipmentViewState();
}

class _ShipmentViewState extends State<ShipmentView> {
  final ClientHomeViewModel _viewModel = instance<ClientHomeViewModel>();

  final MainClientViewModel mainClientViewModel =
      instance<MainClientViewModel>();

  @override
  void initState() {
    _viewModel.getActiveShipmentList(context);
    super.initState();
  }

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
                child: StreamBuilder<bool?>(
                    stream: _viewModel.outputIsShipmentListStatusBarActive,
                    builder: (context, snapshot) {
                      return (snapshot.data ?? true)
                          ? shipmentList(
                              context: context,
                              viewModel: _viewModel,
                              isActiveShipmentList: true,
                              isDetailedCard: true,
                            )
                          : shipmentList(
                              context: context,
                              viewModel: _viewModel,
                              isActiveShipmentList: false,
                              isDetailedCard: true,
                            );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
