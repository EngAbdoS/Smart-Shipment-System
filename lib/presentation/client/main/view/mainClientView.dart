import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class MainClientView extends StatefulWidget {
  const MainClientView({super.key});

  @override
  State<MainClientView> createState() => _MainClientViewState();
}

class _MainClientViewState extends State<MainClientView> {
  final MainClientViewModel _viewModel = instance<MainClientViewModel>();

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: ColorManager.primary,
        child: const Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            color: ColorManager.white,
            size: 40,
          ),
        ),
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
                    Icons.checklist_sharp,
                    Icons.chat,
                    Icons.person,
                  ][index],
                  size: 24,
                  color: isActive ? ColorManager.primary : ColorManager.black,
                );
              },
              activeIndex: snapshot.data ?? 0,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
              onTap: (index) => _viewModel.changeWidget(context, index),
            );
          }),
    );
  }


  @override
  void dispose() {
_viewModel.dispose();    super.dispose();
  }
}
