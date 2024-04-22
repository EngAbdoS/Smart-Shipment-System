import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class DeliveryRegistrationViewModel extends BaseRegistrationViewModel {
  bool _pageOneValidation() {
    return isFirstNameValid(firstName ?? "") &&
        isNationalIdValid(nationalId ?? "") &&
        isPhoneNumberValid(phoneNumber ?? "") &&
        isAddressValid(address ?? "") &&
        isBirthDateValid(birthDate ?? DateTime(0)) &&
        isGenderMan != null;
  }

  void navigateToNextPage(dynamic context, int currentPageIndex) {
    switch (currentPageIndex) {
      case 1:
        {
          _pageOneValidation()
              ? GoRouter.of(context).push(Routes.deliveryRegistrationView2Route)
              : testState(context);
        }

      default:
      // return false;
    }
  }

  void getLoading(dynamic context) {
    testState(context);
    //emit(LoginLoading(asset: "asset"));
  }

  void getsuccess() {
    super.dispose();
    //emit(ClientRegistrationSuccess(route: ""));
  }
}
