import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/domain/use_cases/client_registration_usecase.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/verification/getEmailVerification.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class ClientRegistrationViewModel extends BaseRegistrationViewModel {
  final ClientRegistrationUseCase _clientRegistrationUseCase;

  ClientRegistrationViewModel(this._clientRegistrationUseCase);

  void register(dynamic context) async {
    loadingState(context: context);
    (await _clientRegistrationUseCase.execute(ClientRegistrationUseCaseInput(
            userName: firstName!,
            phone: phoneNumber!,
            email: email!,
            password: password!,
            confirmPassword: confirmPassword!,
            role: AppConstants.userRoleClient)))
        .fold(
      (failure) => {
        errorState(context: context, message: failure.message),
      },
      (data) => data
          ? {
              hideState(context: context),
              getEmailVerification(context, email!, Routes.loginViewRoute),
              toastWidgetC(context, AppStrings.successRegistration),
              print("registered"),
            }
          : {
              errorState(
                context: context,
              ),
            },
    );
  }

  bool areAllClientRegistrationInputsValid() {
    return isFirstNameValid(firstName ?? "") &&
        isEmailValid(email ?? "") &&
        isPhoneNumberValid(phoneNumber ?? "") &&
        isPasswordValid(password ?? "") &&
        isConfirmPasswordValid(confirmPassword ?? "");
  }
}
