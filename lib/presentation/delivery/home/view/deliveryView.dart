import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/delivery/home/viewModel/deliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/widgets/deliveryAppBar.dart';

class DeliveryHomeView extends StatefulWidget {
  const DeliveryHomeView({super.key});

  @override
  State<DeliveryHomeView> createState() => _DeliveryHomeViewState();
}

class _DeliveryHomeViewState extends State<DeliveryHomeView> {
  final DeliveryHomeViewModel _viewModel = instance<DeliveryHomeViewModel>();
  final MainDeliveryViewModel mainClientViewModel =
      instance<MainDeliveryViewModel>();

  @override
  void initState() {
    _viewModel.startHomeView(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        buildDeliverySliverAppBar(
          context: context,
          viewModel: _viewModel,
          mainDeliveryViewModel: mainClientViewModel,
        ),
        // SliverList(
        //   delegate: SliverChildListDelegate(
        //     [
        //       Align(
        //         alignment: Alignment.topCenter,
        //         child: shipmentList(
        //             context: context,
        //             viewModel: _viewModel,
        //             isActiveShipmentList: true),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  @override
  void dispose() {
    //  _viewModel.dispose();
    super.dispose();
  }
}
