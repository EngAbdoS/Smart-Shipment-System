import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/viewModel/clientCreateOrderViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

Widget driversButtonsSection(
    BuildContext context,
    ClientCreateOrderViewModel viewModel,
    MainClientViewModel mainClientViewMode) {
  return StreamBuilder(
      stream: viewModel.outputIsHasDelivery,
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            (snapshot.hasData && snapshot.data!)
                ? Expanded(
                    child: RegularButton(
                            buttonAction: () =>
                                viewModel.confirmShipmentToDeliveries(
                                    context,
                                    () => mainClientViewMode.changeWidget(
                                        context, 7,
                                        id: viewModel.paymentId ?? "")),
                            buttonWidget: Text(
                              AppStrings.confirm_shipment,
                              style: Theme.of(context).textTheme.titleMedium,
                            ).tr())
                        .animate()
                        .slideX(begin: 0.25, end: 0.0, curve: Curves.easeOut),
                  )
                : Container(),
            (snapshot.hasData && snapshot.data!)
                ? SizedBox(width: 10.w)
                : Container(),
            Expanded(
              child: RegularButton(
                      buttonAction: () => viewModel.cancelShipment(context,
                          () => mainClientViewMode.changeWidget(context, 0)),
                      buttonWidget: Text(
                        AppStrings.cancel_order,
                        style: Theme.of(context).textTheme.titleMedium,
                      ).tr())
                  .animate()
                  .slideX(begin: -0.25, end: 0.0, curve: Curves.easeOut),
            ),
          ],
        );
      });
}
