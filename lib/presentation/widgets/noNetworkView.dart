import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class NoNetworkView extends StatelessWidget {
  NoNetworkView({super.key});

  final Repository _repository = instance<Repository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: errorState(
          context: context,
          message: AppStrings.noInternetError,
          buttonAction: () => reRouteNetwork(context)),
    );
  }

  reRouteNetwork(BuildContext context) async {
    loadingState(context: context);
    (
            await _repository.getSplashNextNavigationRoute(context))
        .fold((error) => GoRouter.of(context).pushReplacement(Routes.noRoute),
            (route) => GoRouter.of(context).pushReplacement(route));
  }
}
