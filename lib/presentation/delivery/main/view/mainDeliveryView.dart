import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class MainDeliveryView extends StatefulWidget {
  const MainDeliveryView({super.key});

  @override
  State<MainDeliveryView> createState() => _MainDeliveryViewState();
}

class _MainDeliveryViewState extends State<MainDeliveryView> {
  final MainDeliveryViewModel _viewModel = instance<MainDeliveryViewModel>();

  void _binding() {
    _viewModel.start(context);
  }

  @override
  void initState() {
    _binding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: ColorManager.offWhite,
      body: StreamBuilder<Widget?>(
        stream: _viewModel.outputMainStream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            hideState(context: context);
            return snapshot.data ?? Container();
          } else {
            loadingState(context: context);
            return Container();
          }
        },
      ),
      bottomNavigationBar: StreamBuilder<int?>(
          stream: _viewModel.outputMainIndexStream,
          builder: (context, snapshot) {
            return AnimatedBottomNavigationBar.builder(
              itemCount: 4,
              tabBuilder: (int index, bool isActive) {
                return Icon(
                  <IconData>[
                    Icons.home,
                    Icons.wallet_outlined,
                    Icons.chat,
                    Icons.person,
                  ][index],
                  size: 30,
                  color: isActive ? ColorManager.primary : ColorManager.black,
                );
              },
              activeIndex: snapshot.data ?? 0,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              gapWidth: 0,
              leftCornerRadius: 24,
              rightCornerRadius: 24,
              onTap: (index) => _viewModel.changeWidget(context, index),
            );
          }),
    );
  }

  @override
  void dispose() {
   // _viewModel.dispose();
    super.dispose();
  }
}
