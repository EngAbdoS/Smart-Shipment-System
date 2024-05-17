import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseLoginViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class LoginViewModel extends BaseLoginViewModel{



void login(dynamic context)async
{
  loadingState(context: context);





  /*
  *             _appPreferences.setLoggedIn();

  *(await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold(
            (failure) => {

                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      _appPreferences.setUserID(data.user!.uid);

      inputState.add(ContentState());
      isUserLoggedInSuccessfullyStreamController.add(true);
  *
  *
  *
  * */
}






  void getLoading(dynamic context) {
    loadingState(context: context);
    //emit(LoginLoading(asset: "asset"));
  }

  void getsuccess() {



    super.dispose();
    // emit(LoginSuccess(route: ""));
  }
}