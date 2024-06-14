import 'package:smart_shipment_system/domain/use_cases/login_usecase.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseLoginViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class LoginViewModel extends BaseLoginViewModel {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  void login(dynamic context) async {
    loadingState(context: context);
    (await _loginUseCase
            .execute(LoginUseCaseInput(email: email!, password: password!)))
        .fold(
      (failure) => {
        errorState(context: context, message: failure.message),
      },
      (data) => data
          ? {
              hideState(context: context),
              print(" logind"),
              //TODO navigate
            }
          : {
              errorState(
                context: context,
              ),
            },
    );
  }
}
