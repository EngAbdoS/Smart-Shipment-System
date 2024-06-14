import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class EmailVerificationViewModel {
  final Repository _repository;

  EmailVerificationViewModel(
      this._repository, this.email, this.nextActionRoute);

  final String email;
  final String nextActionRoute;
  String? otp;

  bool isOTPValid() {
    return otp?.length == 6 ?? false;
  }

  setOtp(String otp) {
    this.otp = otp;
  }

  verification(dynamic context) async {
    loadingState(context: context);
    otp = otp?.split('').reversed.join();
    (await _repository.emailVerification(
            EmailVerificationRequest(email: email, code: otp!)))
        .fold(
      (failure) => {
        errorState(context: context, message: failure.message),
      },
      (data) => data
          ? {
              hideState(context: context),
              GoRouter.of(context).pushReplacement(nextActionRoute),
        toastWidgetC(context, AppStrings.successVerified),


        print(" verified"),
            }
          : {
              errorState(
                context: context,
              ),
            },
    );
  }
}
