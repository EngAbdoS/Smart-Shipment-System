import 'dart:async';
import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/domain/models/deliveryTripModel.dart';
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

//external delivery

  final StreamController _externalDeliveryTripListStreamController =
      StreamController<List<DeliveryTripModel>>.broadcast();
  final StreamController _currentIsDeliveryTripValidStreamController =
      StreamController<bool>.broadcast();
  final StreamController _currentDeliveryTripFromLocationValidStreamController =
      StreamController<String>.broadcast();
  final StreamController _currentDeliveryTripToLocationValidStreamController =
      StreamController<String>.broadcast();
  final StreamController _currentDeliveryTripDetailsValidStreamController =
      StreamController<String>.broadcast();
  final StreamController _currentDeliveryTripStartTimeValidStreamController =
      StreamController<String>.broadcast();
  final StreamController _currentDeliveryIsTripOneTimeStreamController =
      StreamController<bool>.broadcast();
  final StreamController _currentDeliveryTripDaysStreamController =
      StreamController<List<String>>.broadcast();

  final StreamController
      _currentDeliveryTripExpectedDurationValidStreamController =
      StreamController<int>.broadcast();

//////////////////////////declarations//////////////////////////

  File? deliveryConfirmationPicture;
  File? deliveryVehicleLicensePicture;
  String? deliveryRole;
  String? vehicle;
  List<DeliveryTripModel> externalDeliveryTripList = [];

  DeliveryTripModel deliveryTrip = DeliveryTripModel(
      fromLocation: LatLng(0, 0),
      toGovernment: "",
      fromAddressName: "",
      toAddressName: "",
      toLocation: LatLng(0, 0),
      fromGovernment: "",
      expectedDurationByMin: 0,
      isOneTime: true,
      tripDetails: "",
      tripTime: "",
      tripDay: "",
      tripWeekDays: []);

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

  Stream<String> get outputCurrentFromLocation =>
      _currentDeliveryTripFromLocationValidStreamController.stream
          .map((location) => location);

  Stream<String> get outputCurrentToLocation =>
      _currentDeliveryTripToLocationValidStreamController.stream
          .map((location) => location);

  Stream<bool> get outputIsCurrentTripDetails =>
      _currentDeliveryTripDetailsValidStreamController.stream
          .map((details) => details.isNotEmpty);

  Stream<String> get outputCurrentTripStartTime =>
      _currentDeliveryTripStartTimeValidStreamController.stream
          .map((time) => time);

  Stream<bool> get outputCurrentTripExpectedDuration =>
      _currentDeliveryTripExpectedDurationValidStreamController.stream
          .map((duration) => duration != 0);

  Stream<List<DeliveryTripModel>> get outputDeliveryTripList =>
      _externalDeliveryTripListStreamController.stream
          .map((externalDeliveryTripList) => externalDeliveryTripList);

  Stream<bool> get outputCurrentDeliveryIsTripOneTime =>
      _currentDeliveryIsTripOneTimeStreamController.stream
          .map((isOneTime) => isOneTime);

  Stream<List<String>> get outputCurrentTripDays =>
      _currentDeliveryTripDaysStreamController.stream.map((days) => days);

  Stream<bool> get outputIsDeliveryTripValid =>
      _currentIsDeliveryTripValidStreamController.stream
          .map((isDeliveryTripValid) => isCurrentDeliveryTripValid());

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

  Sink get inputCurrentFromLocation =>
      _currentDeliveryTripFromLocationValidStreamController.sink;

  Sink get inputCurrentToLocation =>
      _currentDeliveryTripToLocationValidStreamController.sink;

  Sink get inputCurrentTripDetails =>
      _currentDeliveryTripDetailsValidStreamController.sink;

  Sink get inputCurrentTripStartTime =>
      _currentDeliveryTripStartTimeValidStreamController.sink;

  Sink get inputCurrentTripExpectedDuration =>
      _currentDeliveryTripExpectedDurationValidStreamController.sink;

  Sink get inputDeliveryTrip => _externalDeliveryTripListStreamController.sink;

  Sink get inputCurrentDeliveryIsTripOneTime =>
      _currentDeliveryIsTripOneTimeStreamController.sink;

  Sink get inputCurrentTripDays =>
      _currentDeliveryTripDaysStreamController.sink;

  Sink get inputIsCurrentDeliveryTripValid =>
      _currentIsDeliveryTripValidStreamController.sink;

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
          _pageTwoValidation()  || true
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
    inputLoginValidation.add(null);
  }

  setDeliveryVehicleLicensePicture(File deliveryVehicleLicensePicture) async {
    inputDeliveryVehicleLicensePicture.add(deliveryVehicleLicensePicture);
    inputValidateDeliveryVehicleLicensePicture
        .add(deliveryVehicleLicensePicture);
    this.deliveryVehicleLicensePicture = deliveryVehicleLicensePicture;
    inputLoginValidation.add(null);
  }

  setDeliveryRole(dynamic context, String deliveryRole) {
    this.deliveryRole = deliveryRole;
    inputLoginValidation.add(null);
    navigateToNextPage(context, 3);
  }

  setVehicle(String vehicle) {
    inputVehicle.add(vehicle);
    this.vehicle = vehicle;
    inputLoginValidation.add(null);
  }

  setCurrentFromLocationAndGov(LatLng currentFromLocation,
      String currentFromGovernment, String addressName) {
    inputCurrentFromLocation.add(addressName);
    deliveryTrip.fromAddressName = addressName;
    deliveryTrip.fromLocation = currentFromLocation;
    deliveryTrip.fromGovernment = currentFromGovernment;

    inputLoginValidation.add(null);
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentToLocationAndGov(LatLng currentToLocation,
      String currentToGovernment, String addressName) {
    inputCurrentToLocation.add(addressName);
    deliveryTrip.toAddressName = addressName;
    deliveryTrip.toLocation = currentToLocation;
    deliveryTrip.toGovernment = currentToGovernment;

    inputLoginValidation.add(null);
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripDetails(String currentTripDetails) {
    inputCurrentTripDetails.add(currentTripDetails);
    deliveryTrip.tripDetails = currentTripDetails;
    inputLoginValidation.add(null);
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripStartTime(String currentTripStartTime) {
    inputCurrentTripStartTime.add(currentTripStartTime);
    deliveryTrip.tripTime = currentTripStartTime;
    inputLoginValidation.add(null);
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripExpectedDuration(int currentTripExpectedDuration) {
    inputCurrentTripExpectedDuration.add(currentTripExpectedDuration);
    deliveryTrip.expectedDurationByMin = currentTripExpectedDuration;
    inputLoginValidation.add(null);
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentDeliveryIsTripOneTime(bool currentDeliveryIsTripOneTime) {
    inputCurrentDeliveryIsTripOneTime.add(currentDeliveryIsTripOneTime);
    deliveryTrip.isOneTime = currentDeliveryIsTripOneTime;

    deliveryTrip.tripWeekDays = [];
    inputCurrentTripDays.add(deliveryTrip.tripWeekDays);

    deliveryTrip.tripDay = "";
    inputLoginValidation.add(null);
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripDay(String currentTripDay) {
    deliveryTrip.tripWeekDays = [];
    deliveryTrip.tripWeekDays?.add(currentTripDay);
    deliveryTrip.tripDay = currentTripDay;
    inputLoginValidation.add(null);
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripNewDay(List<String> currentTripDays) {
    deliveryTrip.tripWeekDays = currentTripDays;
    inputCurrentTripDays.add(deliveryTrip.tripWeekDays);
    inputLoginValidation.add(null);
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setNewDeliveryTrip() {
    print("heeer");
    externalDeliveryTripList.add(deliveryTrip);
    inputDeliveryTrip.add(externalDeliveryTripList);
    print("a7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(externalDeliveryTripList.length);
    print(externalDeliveryTripList.last.fromLocation);
    setCurrentTripDataEmpty();

    inputLoginValidation.add(null);
  }

  setCurrentTripDataEmpty() {
    deliveryTrip = DeliveryTripModel(
        fromLocation: LatLng(0, 0),
        toGovernment: "",
        fromAddressName: "",
        toAddressName: "",
        toLocation: LatLng(0, 0),
        fromGovernment: "",
        expectedDurationByMin: 0,
        isOneTime: true,
        tripDetails: "",
        tripTime: "",
        tripDay: "",
        tripWeekDays: []);
    inputIsCurrentDeliveryTripValid.add(false);
    inputCurrentFromLocation.add("");
    inputCurrentToLocation.add("");
    inputCurrentTripDetails.add("");
    inputCurrentTripStartTime.add("");
    inputCurrentTripExpectedDuration.add(0);
    inputCurrentDeliveryIsTripOneTime.add(true);
    inputCurrentTripDays.add(deliveryTrip.tripWeekDays);
  }

  deleteTrip(int index) {
    externalDeliveryTripList.removeAt(index);
    inputDeliveryTrip.add(externalDeliveryTripList);
    inputLoginValidation.add(null);
  }

  //////////////////////////validation functions//////////////////////////
  isCurrentDeliveryTripValid() {
    // print("teeet");
    // print(deliveryTrip.fromLocation);
    // print(deliveryTrip.toLocation);
    // print(deliveryTrip.fromGovernment);
    // print(deliveryTrip.toGovernment);
    // print(deliveryTrip.expectedDurationByMin);
    // print(deliveryTrip.tripDetails);
    // print(deliveryTrip.tripTime);
    // print(deliveryTrip.isOneTime);
    // print(deliveryTrip.tripWeekDays);
    // print(deliveryTrip.tripDay);

    return (deliveryTrip.fromLocation != LatLng(0, 0) &&
        deliveryTrip.toLocation != LatLng(0, 0) &&
        deliveryTrip.fromGovernment != "" &&
        deliveryTrip.toGovernment != "" &&
        deliveryTrip.expectedDurationByMin != 0 &&
        deliveryTrip.tripDetails != "" &&
        deliveryTrip.tripTime != "0:0" &&
        deliveryTrip.isOneTime != null &&
        ((deliveryTrip.isOneTime != true &&
                deliveryTrip.tripWeekDays?.length != 0) ||
            (deliveryTrip.isOneTime != false && deliveryTrip.tripDay != "")));
  }

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
    print(firstName);
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
