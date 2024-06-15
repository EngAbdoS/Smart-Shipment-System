import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';

void getEmailVerification(
    {dynamic context,
      required String email,
      required String nextActionRoute,
    bool executeOrRouteOnly = true}) {
  initEmailVerificationModule(email,nextActionRoute,executeOrRouteOnly);
  GoRouter.of(context).pushReplacement(Routes.emilVerificationViewRoute);
}
