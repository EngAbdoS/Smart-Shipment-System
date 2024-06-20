import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/domain/entities/ShipmentEntity.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';

class ClientCreateOrderViewModel {
  final Repository _repository;

  ClientCreateOrderViewModel(this._repository);

  final StreamController _weightValidationStream = BehaviorSubject<int>();
  final StreamController _recipientNameValidationStream =
      BehaviorSubject<String>();
  final StreamController _recipientPhoneValidationStream =
      BehaviorSubject<String>();
  final StreamController _shipmentTypeValidationStream =
      BehaviorSubject<String>();
  final StreamController _currentIsShipmentValidStreamController =
      StreamController<bool>.broadcast();
  ShipmentEntity shipment = ShipmentEntity(
    date: DateTime.now().toString(),
    type: '',
    recipentName: 'recipentName',
    //TODO input
    reciepentPhone: 'reciepentPhone',
    //TODO input
    senderName: 'senderName',
    senderPhone: 'senderPhone',
    startLoc: const LatLng(0, 0),
    endLoc: const LatLng(0, 0),
    endLocation: '',
    startLocation: '',
    weight: '',
    quantity: 0,
    description: '',
  );

  Stream<bool> get outputIsShipmentTypeValid =>
      _shipmentTypeValidationStream.stream.map((type) => type != '');

  Stream<bool> get outputIsRecipientNameValid =>
      _recipientNameValidationStream.stream.map((name) => name != '');

  Stream<bool> get outputIsWeightValid =>
      _weightValidationStream.stream.map((weight) => weight != 0);

  Stream<bool> get outputRecipientPhoneValid =>
      _recipientPhoneValidationStream.stream
          .map((phoneNumber) => isPhoneNumberValid(phoneNumber));

  Sink get inputShipmentTypeValidation => _shipmentTypeValidationStream.sink;

  Sink get inputRecipientPhoneNumber => _recipientPhoneValidationStream.sink;

  Sink get inputRecipientName => _recipientNameValidationStream.sink;

  Sink get inputWightValidation => _weightValidationStream.sink;

  Sink get inputIsCurrentShipmentValid =>
      _currentIsShipmentValidStreamController.sink;
addShipment(dynamic context)
{

}
  setCurrentFromLocationAndGov(LatLng currentFromLocation,
      String currentFromGovernment, String addressName) {
    shipment.startLoc = currentFromLocation;
    shipment.startLocation = currentFromGovernment;
    print(addressName);
  }

  setCurrentToLocationAndGov(LatLng currentToLocation,
      String currentToGovernment, String addressName) {
    shipment.endLoc = currentToLocation;
    shipment.endLocation = currentToGovernment;
    print(addressName);
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

  bool isPhoneNumberValid(String phoneNumber) =>
      isEgyptionPhoneNumberValid(phoneNumber);

  bool isAllShipmentDataValid() {
    return shipment.type != '' &&
        shipment.recipentName != '' &&
        shipment.reciepentPhone != '' &&
        shipment.weight != '0 kg' &&
        shipment.weight != ''&&shipment.endLocation!='' && shipment.startLocation!=''&&shipment.endLoc!= const LatLng(0, 0) && shipment.startLoc!= const LatLng(0, 0);
  }

  dispose() {
    _weightValidationStream.close();
    _recipientNameValidationStream.close();
    _recipientPhoneValidationStream.close();
    _shipmentTypeValidationStream.close();
    _currentIsShipmentValidStreamController.close();
  }
}
