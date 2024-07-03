import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/clientAppBar.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentList.dart';

class ShipmentView extends StatefulWidget {
  const ShipmentView({super.key});

  @override
  State<ShipmentView> createState() => _ShipmentViewState();
}

class _ShipmentViewState extends State<ShipmentView> {
  final ClientHomeViewModel _viewModel = instance<ClientHomeViewModel>();

  final MainClientViewModel mainClientViewModel =
      instance<MainClientViewModel>();
  final ScrollController _scrollController = ScrollController();

  _binding() {
    _viewModel.outputShipmentScrollPositionStream.listen((positionIndex) {
      double offset = ((positionIndex ?? 0) + 1) * 400.h;
      offset = offset >= _scrollController.position.maxScrollExtent
          ? _scrollController.position.maxScrollExtent
          : offset;
      _scrollController.animateTo(offset,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInBack);
    });
  }

  @override
  void initState() {
    _binding();
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
                              mainClientViewModel: mainClientViewModel,
                              isActiveShipmentList: true,
                              isDetailedCard: true,
                              scrollController: _scrollController,
                            )
                          : shipmentList(
                              context: context,
                              viewModel: _viewModel,
                              mainClientViewModel: mainClientViewModel,
                              isActiveShipmentList: false,
                              isDetailedCard: true,
                              scrollController: _scrollController,
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
