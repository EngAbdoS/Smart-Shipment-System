import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/delivery/tripList/viewModel/tripListViewModel.dart';

class TripListView extends StatelessWidget {
   TripListView({super.key});
final TripListViewModel _viewModel = instance<TripListViewModel>();


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

