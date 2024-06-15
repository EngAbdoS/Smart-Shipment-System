import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';

void getChangePassword(dynamic context, String otp) {
  initChangePasswordModule(otp);
  GoRouter.of(context).pushReplacement(Routes.changePasswordViewRoute);
}
