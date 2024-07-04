import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/delivery/activiesHistory/viewModel/activiesHistoryViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/widgets/deliveryOrdersList.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/customSliverAppBar.dart';

class ActivitiesHistoryView extends StatefulWidget {
  const ActivitiesHistoryView({super.key});

  @override
  State<ActivitiesHistoryView> createState() => _ActivitiesHistoryViewState();
}

class _ActivitiesHistoryViewState extends State<ActivitiesHistoryView> {
  final ActivitiesHistoryViewModel _viewModel =
      instance<ActivitiesHistoryViewModel>();
  final MainDeliveryViewModel mainClientViewModel =
      instance<MainDeliveryViewModel>();
  final ScrollController _scrollController = ScrollController();

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
        customSliverAppBar(
            context: context,
            user: _viewModel.userHomeData,
            title: AppStrings.active_history,
            profileNavigate:()=>mainClientViewModel.changeWidget(context, 3)),

        SliverList(
          delegate: SliverChildListDelegate(
            [
              Align(
                alignment: Alignment.topCenter,
                child: deliveryOrdersList(
                  context: context,
                  viewModel: _viewModel,
                  scrollController: _scrollController,
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
