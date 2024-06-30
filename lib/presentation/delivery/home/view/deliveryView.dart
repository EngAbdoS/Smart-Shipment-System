import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/delivery/home/viewModel/deliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/widgets/deliveryAppBar.dart';
import 'package:smart_shipment_system/presentation/delivery/widgets/deliveryOrdersList.dart';

class DeliveryHomeView extends StatefulWidget {
  const DeliveryHomeView({super.key});

  @override
  State<DeliveryHomeView> createState() => _DeliveryHomeViewState();
}

class _DeliveryHomeViewState extends State<DeliveryHomeView> {
  final DeliveryHomeViewModel _viewModel = instance<DeliveryHomeViewModel>();
  final MainDeliveryViewModel mainClientViewModel =
      instance<MainDeliveryViewModel>();
  final ScrollController _scrollController = ScrollController();
_binding()
{
  _scrollController.addListener(_onScroll);



}
  void _onScroll() {
    if (!_viewModel.isPaginationLoading && _scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.7) {
      _viewModel.getAllShipments(context);
    }
  }
  @override
  void initState() {
    _viewModel.startHomeView(context);
    _binding();
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
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Align(
                alignment: Alignment.topCenter,
                child: deliveryOrdersList(
                  context: context,
                  outputDeliveryOrdersList: _viewModel.outputOrdersList,
                  scrollController: _scrollController,
                  assignOrderToMe: _viewModel.assignOrderToMe,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    //  _viewModel.dispose();
    super.dispose();
  }
}
