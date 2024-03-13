import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
     import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/clientRegistration/manager/clientRegistrationCubitStates.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class ClientRegistrationCubit extends Cubit<ClientRegistrationCubitStates> {
  ClientRegistrationCubit() : super(ClientRegistrationInitial());

  final BaseRegistrationViewModel baseRegistrationViewModel = instance<BaseRegistrationViewModel>();

  void getLoading(dynamic context) {
    testState(context);
    //emit(LoginLoading(asset: "asset"));
  }

  void getsuccess() {



    baseRegistrationViewModel.dispose();
    emit(ClientRegistrationSuccess(route: ""));
  }
}
