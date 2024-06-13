import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/domain/use_cases/client_registration_usecase.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class ClientRegistrationViewModel extends BaseRegistrationViewModel {
  final ClientRegistrationUseCase _clientRegistrationUseCase;

  ClientRegistrationViewModel(this._clientRegistrationUseCase);

  void register(dynamic context) async {
    loadingState(context: context);
    (await _clientRegistrationUseCase.execute(ClientRegistrationUseCaseInput(
         userName:    firstName!,
         phone:    phoneNumber!,
          email:   email!,
          password:   password!,
          confirmPassword:   confirmPassword!,
         role:    AppConstants.userRoleClient)))
        .fold(
      (failure) => {
        errorState(context: context, message: failure.message),
      },
      (data) => data
          ? {
              context.loaderOverlay.hide(),
              print(" registered"),
              //TODO navigate
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
