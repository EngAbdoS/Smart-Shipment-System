import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/domain/use_cases/client_registration_usecase.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class ClientRegistrationViewModel extends BaseRegistrationViewModel {
  final ClientRegistrationUseCase _clientRegistrationUseCase;

  ClientRegistrationViewModel(this._clientRegistrationUseCase);

  void register(dynamic context) async {
    loadingState(context: context);

    (await _clientRegistrationUseCase.execute(ClientRegistrationUseCaseInput(
            firstName!,
            phoneNumber!,
            email!,
            password!,
            confirmPassword!,
            AppConstants.userRoleClient)))
        .fold(
            (failure) => {
                  getLoading(context)
                  //TODO create error state
                }, (data) {
      print("data.message");
      print(data.message);
      testState(context);
      loadingState(context: context, message: "success");
      // TODO navigate otp
    });
  }

  bool areAllClientRegistrationInputsValid() {
    return isFirstNameValid(firstName ?? "") &&
        isEmailValid(email ?? "") &&
        isPhoneNumberValid(phoneNumber ?? "") &&
        isPasswordValid(password ?? "") &&
        isConfirmPasswordValid(confirmPassword ?? "");
  }


  void getLoading(dynamic context) {
    testState(context);
  }

  void getsuccess() {
    super.dispose();
  }


}
