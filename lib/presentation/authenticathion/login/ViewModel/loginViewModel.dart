import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseLoginViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class LoginViewModel extends BaseLoginViewModel{










  void getLoading(dynamic context) {
    testState(context);
    //emit(LoginLoading(asset: "asset"));
  }

  void getsuccess() {



    super.dispose();
    // emit(LoginSuccess(route: ""));
  }
}