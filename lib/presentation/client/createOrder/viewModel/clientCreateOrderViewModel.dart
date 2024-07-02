import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/entities/ShipmentEntity.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class ClientCreateOrderViewModel {
  final Repository _repository;
  UserModel userProfileData;

  ClientCreateOrderViewModel(this._repository, this.userProfileData);

  final StreamController _weightValidationStream = BehaviorSubject<int>();
  final StreamController _recipientNameValidationStream =
      BehaviorSubject<String>();
  final StreamController _recipientPhoneValidationStream =
      BehaviorSubject<String>();
  final StreamController _shipmentTypeValidationStream =
      BehaviorSubject<String>();
  final StreamController _shipmentDescriptionValidationStream =
      BehaviorSubject<String>();
  final StreamController _shipmentQuantityValidationStream =
      BehaviorSubject<int>();
  final StreamController _currentIsShipmentValidStreamController =
      StreamController<bool>.broadcast();
  List<RecommendedDeliveryEntity> recommendedDeliveryList = [];
  ShipmentEntity shipment = ShipmentEntity(
    date: DateTime.now().toString(),
    type: '',
    recipentName: '',
    reciepentPhone: '',
    senderName: '',
    senderPhone: '',
    startLoc: const LatLng(0, 0),
    endLoc: const LatLng(0, 0),
    endLocation: '',
    startLocation: '',
    weight: '',
    quantity: 0,
    description: '',
  );
  ShipmentModel? createdShipment;

  Stream<bool> get outputIsShipmentTypeValid =>
      _shipmentTypeValidationStream.stream.map((type) => type != '');

  Stream<bool> get outputIsRecipientNameValid =>
      _recipientNameValidationStream.stream.map((name) => name != '');

  Stream<bool> get outputIsDescriptionValid =>
      _shipmentDescriptionValidationStream.stream
          .map((description) => description != '');

  Stream<bool> get outputIsWeightValid =>
      _weightValidationStream.stream.map((weight) => weight != 0);

  Stream<bool> get outputIsQuantityValid =>
      _shipmentQuantityValidationStream.stream.map((quantity) => quantity != 0);

  Stream<bool> get outputRecipientPhoneValid =>
      _recipientPhoneValidationStream.stream
          .map((phoneNumber) => isPhoneNumberValid(phoneNumber));

  Sink get inputShipmentTypeValidation => _shipmentTypeValidationStream.sink;

  Sink get inputRecipientPhoneNumber => _recipientPhoneValidationStream.sink;

  Sink get inputRecipientName => _recipientNameValidationStream.sink;

  Sink get inputQuantity => _shipmentQuantityValidationStream.sink;

  Sink get inputDescription => _shipmentDescriptionValidationStream.sink;

  Sink get inputWightValidation => _weightValidationStream.sink;

  Sink get inputIsCurrentShipmentValid =>
      _currentIsShipmentValidStreamController.sink;

  addShipment(dynamic context, GestureTapCallback navigate) async {
    loadingState(context: context);
    (await _repository.createShipment(
      CreateShipmentRequest(
        type: shipment.type,
        recipentName: shipment.recipentName,
        reciepentPhone: shipment.reciepentPhone,
        senderName: userProfileData.userName,
        senderPhone: userProfileData.phoneNumber,
        startLoc: CurrentStateRequest(
          type: AppConstants.currentStateTypePoint,
          coordinates: [
            shipment.startLoc.longitude,
            shipment.startLoc.latitude
          ],
        ),
        currentLoc: CurrentStateRequest(
          type: AppConstants.currentStateTypePoint,
          coordinates: [
            shipment.startLoc.longitude,
            shipment.startLoc.latitude
          ],
        ),
        endLoc: CurrentStateRequest(
          type: AppConstants.currentStateTypePoint,
          coordinates: [shipment.endLoc.longitude, shipment.endLoc.latitude],
        ),
        endLocation: shipment.endLocation,
        startLocation: shipment.startLocation,
        weight: shipment.weight,
        quantity: shipment.quantity,
        description: shipment.description,
      ),
    ))
        .fold(
            (failure) => {
                  errorState(context: context, message: failure.message),
                }, (data) async {
      createdShipment = data;
      print(createdShipment?.id ?? "noid");
      await getRecommendedDelivery(context);
      navigate();
      hideState(context: context);
    });
  }

  getRecommendedDelivery(dynamic context) async {
    loadingState(context: context);
    (await _repository.getRecommendedDeliveries(GetShippingPathRequest(
            endLoc: CurrentStateRequest(
                type: AppConstants.currentStateTypePoint,
                coordinates: [
                  shipment.endLoc.longitude,
                  shipment.endLoc.latitude
                ]),
            startLoc: CurrentStateRequest(
                type: AppConstants.currentStateTypePoint,
                coordinates: [
                  shipment.startLoc.longitude,
                  shipment.startLoc.latitude
                ]),
            startState: shipment.startLocation,
            endState: shipment.endLocation)))
        .fold(
            (failure) => {
                  errorState(context: context, message: failure.message),
                }, (data) {
      recommendedDeliveryList = data;
      hideState(context: context);
    });
  }

  confirmShipmentToDeliveries(
      dynamic context, GestureTapCallback navigate) async {
    loadingState(context: context);
    List<String> deliveryId =
        recommendedDeliveryList.map((delivery) => delivery.id).toList();
    (await _repository.clientAssignOrderToDelivery(
            createdShipment?.id ?? "noid", deliveryId))
        .fold(
            (failure) => {
                  errorState(context: context, message: failure.message),
                }, (data) {
      data
          ? {navigate(), hideState(context: context)}
          : errorState(context: context, message: AppStrings.unknownError);
    });
  }

  cancelShipment(dynamic context, GestureTapCallback navigate) async {
    loadingState(context: context);
    (await _repository.cancelOrderById(createdShipment?.id ?? "noid")).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) {
      navigate();
      hideState(context: context);
    });
  }

  setCurrentFromLocationAndGov(LatLng currentFromLocation,
      String currentFromGovernment, String addressName) {
    shipment.startLoc = currentFromLocation;
    shipment.startLocation = currentFromGovernment;
  }

  setCurrentToLocationAndGov(LatLng currentToLocation,
      String currentToGovernment, String addressName) {
    shipment.endLoc = currentToLocation;
    shipment.endLocation = currentToGovernment;
  }

  setRecipientName(String recipient) {
    inputRecipientName.add(recipient);
    shipment.recipentName = recipient;
  }

  setRecipientPhone(String phoneNumber) {
    inputRecipientPhoneNumber.add(phoneNumber);
    shipment.reciepentPhone = phoneNumber;
  }

  setShipmentWeight(String weight) {
    int weightKg = int.tryParse(weight) ?? 0;
    inputWightValidation.add(weightKg);
    shipment.weight = '$weight kg';
  }

  setShipmentType(String type) {
    inputShipmentTypeValidation.add(type);
    shipment.type = type;
  }

  setShipmentDescription(String description) {
    inputDescription.add(description);
    shipment.description = description;
  }

  setShipmentQuantity(String quantity) {
    int quantityInt = int.tryParse(quantity) ?? 0;
    inputQuantity.add(quantityInt);
    print(quantityInt);
    shipment.quantity = quantityInt;
  }

  bool isPhoneNumberValid(String phoneNumber) =>
      isEgyptionPhoneNumberValid(phoneNumber);

  bool isAllShipmentDataValid() {
    return shipment.type != '' &&
        shipment.recipentName != '' &&
        shipment.reciepentPhone != '' &&
        shipment.weight != '0 kg' &&
        shipment.weight != '' &&
        shipment.endLocation != '' &&
        shipment.startLocation != '' &&
        shipment.description != "" &&
        shipment.quantity != 0 &&
        shipment.endLoc != const LatLng(0, 0) &&
        shipment.startLoc != const LatLng(0, 0);
  }

  dispose() {
    _weightValidationStream.close();
    _recipientNameValidationStream.close();
    _recipientPhoneValidationStream.close();
    _shipmentTypeValidationStream.close();
    _currentIsShipmentValidStreamController.close();
  }
}
