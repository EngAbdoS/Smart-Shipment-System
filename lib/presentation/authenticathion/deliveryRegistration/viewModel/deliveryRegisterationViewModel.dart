import 'dart:async';
import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class DeliveryRegistrationViewModel extends BaseRegistrationViewModel {
  final StreamController
      _deliveryConfirmationPictureValidationStreamController =
      StreamController<File>.broadcast();

  final StreamController _deliveryConfirmationPictureStreamController =
      StreamController<File>.broadcast();

  final StreamController
      _deliveryVehicleLicensePictureValidationStreamController =
      StreamController<File>.broadcast();

  final StreamController _deliveryVehicleLicensePictureStreamController =
      StreamController<File>.broadcast();

  final StreamController _vehicleStreamController =
      StreamController<String>.broadcast();

//////////////////////////declarations//////////////////////////

  File? deliveryConfirmationPicture;
  File? deliveryVehicleLicensePicture;
  String? deliveryRole;
  String? vehicle;

//////////////////////////output//////////////////////////

  Stream<bool> get outputIsDeliveryConfirmationPictureValid =>
      _deliveryConfirmationPictureValidationStreamController.stream
          .map((file) => isDeliveryConfirmationPictureValid(file));

  Stream<File> get outputDeliveryConfirmationPicture =>
      _deliveryConfirmationPictureStreamController.stream.map((file) => file);

  Stream<bool> get outputIsDeliveryVehicleLicensePictureValid =>
      _deliveryVehicleLicensePictureValidationStreamController.stream
          .map((file) => isDeliveryVehicleLicensePictureValid(file));

  Stream<File> get outputDeliveryVehicleLicensePicture =>
      _deliveryVehicleLicensePictureStreamController.stream.map((file) => file);

  Stream<bool> get outputIsVehicleValid =>
      _vehicleStreamController.stream.map((vehicle) => isVehicleValid(vehicle));

  //////////////////////////input//////////////////////////

  Sink get inputDeliveryConfirmationPicture =>
      _deliveryConfirmationPictureStreamController.sink;

  Sink get inputValidateDeliveryConfirmationPicture =>
      _deliveryConfirmationPictureValidationStreamController.sink;

  Sink get inputDeliveryVehicleLicensePicture =>
      _deliveryVehicleLicensePictureStreamController.sink;

  Sink get inputValidateDeliveryVehicleLicensePicture =>
      _deliveryVehicleLicensePictureValidationStreamController.sink;

  Sink get inputVehicle => _vehicleStreamController.sink;

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
          _pageTwoValidation()|| true
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

  setDeliveryVehicleLicensePicture(File deliveryVehicleLicensePicture) async {
    inputDeliveryVehicleLicensePicture.add(deliveryVehicleLicensePicture);
    inputValidateDeliveryVehicleLicensePicture
        .add(deliveryVehicleLicensePicture);
    this.deliveryVehicleLicensePicture = deliveryVehicleLicensePicture;
    inputValidation.add(null);
  }

  setDeliveryRole(dynamic context, String deliveryRole) {
    this.deliveryRole = deliveryRole;
    inputValidation.add(null);
    navigateToNextPage(context, 3);
  }

  setVehicle(String vehicle) {
    inputVehicle.add(vehicle);
    this.vehicle = vehicle;
    inputValidation.add(null);
  }

  //////////////////////////validation functions//////////////////////////

  bool isDeliveryConfirmationPictureValid(File deliveryConfirmationPicture) {
    //TODO validation
    return
        // deliveryConfirmationPicture.lengthSync() <=
        //       AppConstants.confirmationPictureSizeByBytes &&
        deliveryConfirmationPicture.path.isNotEmpty;
  }

  bool isDeliveryVehicleLicensePictureValid(
      File deliveryVehicleLicensePicture) {
    //TODO validation
    return
        // deliveryConfirmationPicture.lengthSync() <=
        //       AppConstants.confirmationPictureSizeByBytes &&
        deliveryVehicleLicensePicture.path.isNotEmpty;
  }

  bool isDeliveryRoleValid(String deliveryRole) {
    return deliveryRole.isNotEmpty;
  }

  bool isVehicleValid(String vehicle) {
    return vehicle.isNotEmpty;
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
    return isDeliveryRoleValid(deliveryRole ?? "");
  }

///////////////////////////////////////////////////////////////////////
  void getLoading(dynamic context) {
    testState(context);
    //emit(LoginLoading(asset: "asset"));
  }
  void login(dynamic context) {
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
    _deliveryConfirmationPictureValidationStreamController.close();
  }
}
