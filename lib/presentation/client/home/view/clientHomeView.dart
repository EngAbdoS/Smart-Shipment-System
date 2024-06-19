import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/clientAppBar.dart';
import '../../widgets/shipmentList.dart';

class ClientHomeView extends StatefulWidget {
  const ClientHomeView({super.key});

  @override
  State<ClientHomeView> createState() => _ClientHomeViewState();
}

class _ClientHomeViewState extends State<ClientHomeView> {
  final ClientHomeViewModel _viewModel = instance<ClientHomeViewModel>();
  final MainClientViewModel mainClientViewModel =
      instance<MainClientViewModel>();

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
        buildSliverAppBar(
            context: context,
            clientViewModel: _viewModel,
            mainClientViewModel: mainClientViewModel),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Align(
                alignment: Alignment.topCenter,
                child: shipmentList(
                    context: context,
                    viewModel: _viewModel,
                    isActiveShipmentList: true),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
