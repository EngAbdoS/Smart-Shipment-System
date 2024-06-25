import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/presentation/delivery/tripList/viewModel/tripListViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTrip/deliveryAddedTripList.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTrip/deliveryTripInputWidget.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTrip/deliveryTripList.dart';
import 'package:smart_shipment_system/presentation/widgets/deliveryTrip/deliveryTripWidget.dart';

class TripListView extends StatefulWidget {
  TripListView({super.key});

  @override
  State<TripListView> createState() => _TripListViewState();
}

class _TripListViewState extends State<TripListView> {
  final TripListViewModel _viewModel = instance<TripListViewModel>();

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.offWhite,
      height: double.maxFinite,
      width: double.maxFinite,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              deliveryTripList(context, _viewModel.outputDeliveryTripList,
                  _viewModel.deleteTrip),
              DeliveryTripInputWidget(
                viewModel: _viewModel,
              ).animate().scaleXY(
                  begin: 0.5, end: 1.0, curve: Curves.fastEaseInToSlowEaseOut),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
