import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class DeliveryRegistrationViewModel extends BaseRegistrationViewModel{




void nextPage(dynamic context ,int currentPageIndex)
{
  print ("a7777");


}



  void getLoading(dynamic context) {
    testState(context);
    //emit(LoginLoading(asset: "asset"));
  }

  void getsuccess() {



    super. dispose();
    //emit(ClientRegistrationSuccess(route: ""));
  }



}