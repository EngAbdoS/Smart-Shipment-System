import 'dart:async';
import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class DeliveryRegistrationViewModel extends BaseRegistrationViewModel {
  StreamController deliveryConfirmationPictureValidationStreamController =
      StreamController<File>.broadcast();
  StreamController deliveryConfirmationPictureStreamController =
  StreamController<File>.broadcast();

  File? deliveryConfirmationPicture;

  Sink get inputDeliveryConfirmationPicture =>
      deliveryConfirmationPictureStreamController.sink;
  Sink get inputValidateDeliveryConfirmationPicture =>
      deliveryConfirmationPictureValidationStreamController.sink;

  Stream<bool> get outputIsDeliveryConfirmationPictureValid =>
      deliveryConfirmationPictureValidationStreamController.stream
          .map((file) => isDeliveryConfirmationPictureValid(file));
  Stream<File> get outputDeliveryConfirmationPicture =>
      deliveryConfirmationPictureStreamController.stream
          .map((file) => file);

  setDeliveryConfirmationPicture(File deliveryConfirmationPicture) async {
    inputDeliveryConfirmationPicture.add(deliveryConfirmationPicture);
    inputValidateDeliveryConfirmationPicture.add(deliveryConfirmationPicture);
    this.deliveryConfirmationPicture = deliveryConfirmationPicture;
    inputValidation.add(null);
  }

  bool isDeliveryConfirmationPictureValid(File deliveryConfirmationPicture) {
    //TODO validation

    return deliveryConfirmationPicture.path.isNotEmpty;
  }

  bool _pageOneValidation() {
    return isFirstNameValid(firstName ?? "") &&
        isNationalIdValid(nationalId ?? "") &&
        isPhoneNumberValid(phoneNumber ?? "") &&
        isAddressValid(address ?? "") &&
        isBirthDateValid(birthDate ?? DateTime(0)) &&
        isGenderMan != null;
  }

  bool _pageTwoValidation() {
    return isPasswordValid(password ?? "") &&
        isEmailValid(email ?? "") &&
        isConfirmPasswordValid(confirmPassword ?? "");
  }

  void navigateToNextPage(dynamic context, int currentPageIndex) {
    switch (currentPageIndex) {
      case 1:
        {
          _pageOneValidation()
              ? GoRouter.of(context).push(Routes.deliveryRegistrationView2Route)
              : testState(context);
        }
      case 2:
        {
          _pageTwoValidation()
              ? GoRouter.of(context).push(Routes.deliveryRegistrationView3Route)
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
    dispose();
    //emit(ClientRegistrationSuccess(route: ""));
  }

  @override
  void dispose() {
    super.dispose();
    deliveryConfirmationPictureValidationStreamController.close();
  }
}
