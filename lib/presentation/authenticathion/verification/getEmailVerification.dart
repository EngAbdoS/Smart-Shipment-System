
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';

void getEmailVerification(
    {dynamic context,
    required String email,
    required String nextActionRoute,
    bool executeOrRouteOnly = true}) {

  //execute call verification endPoint
  //navigateOnly navigates to changePassword screen only


  initEmailVerificationModule(email, nextActionRoute, executeOrRouteOnly);
  executeOrRouteOnly
      ? Navigator.of(context).pushReplacementNamed(Routes.emilVerificationViewRoute)
      : Navigator.of(context).pushNamed(Routes.emilVerificationViewRoute);
}
