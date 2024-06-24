import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/registrationSlider.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/viewModel/clientCreateOrderViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/client/widgets/recommendedDeliveryList.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentWidgets.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/inputLocationWidget.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

import '../../../resources/values_manager.dart';

class ClientCreateOrderRecommendedDeliveriesMainView extends StatelessWidget {
  ClientCreateOrderRecommendedDeliveriesMainView({super.key});

  final ClientCreateOrderViewModel _viewModel =
      instance<ClientCreateOrderViewModel>();
  final MainClientViewModel _mainClientViewMode =
      instance<MainClientViewModel>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 84.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.add_shipment,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr().animate(delay: 300.milliseconds).fade(
                    duration: 300.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut),
                const RegistrationSlider(pageIndex: 2),
                SizedBox(height: 25.h),
                Column(
                  children: <Widget>[
                    recommendedDeliveryList(
                        context, _viewModel.recommendedDeliveryList),
                    SizedBox(height: 25.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
