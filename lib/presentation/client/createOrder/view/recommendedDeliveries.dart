import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/registrationSlider.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/viewModel/clientCreateOrderViewModel.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/widgets/priceWidget.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/widgets/recommendedDeliveryList.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

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
                priceWidget(context, _viewModel.createdShipment?.price),
                Column(
                  children: <Widget>[
                    recommendedDeliveryList(
                        context, _viewModel.recommendedDeliveryList),
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _viewModel.recommendedDeliveryList.isNotEmpty
                            ? Expanded(
                                child: RegularButton(
                                    buttonAction: () =>
                                        _viewModel.confirmShipmentToDeliveries(
                                            context,
                                            () => _mainClientViewMode
                                                .changeWidget(context, 7)),
                                    buttonWidget: Text(
                                      AppStrings.confirm_shipment,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ).tr()),
                              )
                            : Container(),
                        _viewModel.recommendedDeliveryList.isNotEmpty
                            ? SizedBox(width: 10.w)
                            : Container(),
                        Expanded(
                          child: RegularButton(
                              buttonAction: () => _viewModel.cancelShipment(
                                  context,
                                  () => _mainClientViewMode.changeWidget(
                                      context, 0)),
                              buttonWidget: Text(
                                AppStrings.cancel_order,
                                style: Theme.of(context).textTheme.titleMedium,
                              ).tr()),
                        ),
                      ],
                    ),
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
