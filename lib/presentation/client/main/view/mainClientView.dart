import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

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
    ));
  }
}
