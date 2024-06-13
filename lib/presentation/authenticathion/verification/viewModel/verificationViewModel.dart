import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class EmailVerificationViewModel {
  final Repository _repository;

  EmailVerificationViewModel(this._repository, this.email);
final String email;
  String ? otp;

  bool isOTPValid() => otp?.length == 6 ?? false;


  verification(dynamic context) async {
    loadingState(context: context);
    (await  _repository.emailVerification(EmailVerificationRequest(email: email, code: otp!)))
        .fold(
          (failure) =>
      {
        errorState(context: context, message: failure.message),
      },
          (data) =>
      data
          ? {
        context.loaderOverlay.hide(),
        print(" verified"),
//TODO navigate to login
      }
          : {
        errorState(
          context: context,
        ),
      },
    );
  }

}


