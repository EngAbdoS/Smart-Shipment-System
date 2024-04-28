import 'dart:async';
import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class DeliveryRegistrationViewModel extends BaseRegistrationViewModel {
  StreamController deliveryConfirmationPictureValidationStreamController =
      StreamController<File>.broadcast();

  StreamController deliveryConfirmationPictureStreamController =
      StreamController<File>.broadcast();

//////////////////////////declarations//////////////////////////

  File? deliveryConfirmationPicture;
  String? deliveryRole;

//////////////////////////output//////////////////////////

  Stream<bool> get outputIsDeliveryConfirmationPictureValid =>
      deliveryConfirmationPictureValidationStreamController.stream
          .map((file) => isDeliveryConfirmationPictureValid(file));

  Stream<File> get outputDeliveryConfirmationPicture =>
      deliveryConfirmationPictureStreamController.stream.map((file) => file);

  //////////////////////////input//////////////////////////

  Sink get inputDeliveryConfirmationPicture =>
      deliveryConfirmationPictureStreamController.sink;

  Sink get inputValidateDeliveryConfirmationPicture =>
      deliveryConfirmationPictureValidationStreamController.sink;

//////////////////////////functions//////////////////////////

  void navigateToNextPage(dynamic context, int currentPageIndex) {
    switch (currentPageIndex) {
      case 1:
        {
          _pageOneValidation() || true
              ? GoRouter.of(context).push(Routes.deliveryRegistrationView2Route)
              : testState(context);
        }
      case 2:
        {
          _pageTwoValidation()
              ? GoRouter.of(context)
                  .push(Routes.deliveryRegistrationRoleViewRoute)
              : testState(context);
        }
      case 3: //delivery role
        {
          _pageDeliveryRoleValidation()
              ? deliveryRole == AppConstants.deliveryRoleExternal
                  ? GoRouter.of(context)
                      .push(Routes.deliveryExternalRegistrationViewRoute)
                  : GoRouter.of(context)
                      .push(Routes.deliveryInteriorRegistrationViewRoute)
              : testState(context);
        }
      default:
      // return false;
    }
  }

  setDeliveryConfirmationPicture(File deliveryConfirmationPicture) async {
    inputDeliveryConfirmationPicture.add(deliveryConfirmationPicture);
    inputValidateDeliveryConfirmationPicture.add(deliveryConfirmationPicture);
    this.deliveryConfirmationPicture = deliveryConfirmationPicture;
    inputValidation.add(null);
  }

  setDeliveryRole(dynamic context, String deliveryRole) {
    this.deliveryRole = deliveryRole;
    inputValidation.add(null);
    navigateToNextPage(context, 3);
  }

  //////////////////////////validation functions//////////////////////////

  bool isDeliveryConfirmationPictureValid(File deliveryConfirmationPicture) {
    //TODO validation
    return
        // deliveryConfirmationPicture.lengthSync() <=
        //       AppConstants.confirmationPictureSizeByBytes &&
        deliveryConfirmationPicture.path.isNotEmpty;
  }

  bool isDeliveryRoleValid() {
    return deliveryRole?.isNotEmpty ?? false;
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
        isConfirmPasswordValid(confirmPassword ?? "") &&
        isDeliveryConfirmationPictureValid(
            deliveryConfirmationPicture ?? File(""));
  }

  bool _pageDeliveryRoleValidation() {
    return isDeliveryRoleValid();
  }

///////////////////////////////////////////////////////////////////////
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
