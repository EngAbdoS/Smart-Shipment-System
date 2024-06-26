import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/domain/models/deliveryTripModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class TripListViewModel {
  TripListViewModel(this._repository, this.tripList);

  final Repository _repository;

  final List<DeliveryTripEntity> tripList;
  DeliveryTripModel deliveryTrip = DeliveryTripModel(
      fromLocation: const LatLng(0, 0),
      toGovernment: "",
      fromAddressName: "",
      toAddressName: "",
      toLocation: const LatLng(0, 0),
      fromGovernment: "",
      expectedDurationByMin: 0,
      isOneTime: true,
      tripDetails: "",
      tripTime: "",
      tripDay: "",
      tripWeekDays: []);

  start() {
    inputDeliveryTrip.add(tripList);
  }

  final StreamController _externalDeliveryTripListStreamController =
      BehaviorSubject<List<DeliveryTripEntity>>();

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

  Stream<List<DeliveryTripEntity>> get outputDeliveryTripList =>
      _externalDeliveryTripListStreamController.stream
          .map((externalDeliveryTripList) => externalDeliveryTripList);

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

  Stream<bool> get outputCurrentDeliveryIsTripOneTime =>
      _currentDeliveryIsTripOneTimeStreamController.stream
          .map((isOneTime) => isOneTime);

  Stream<List<String>> get outputCurrentTripDays =>
      _currentDeliveryTripDaysStreamController.stream.map((days) => days);

  Stream<bool> get outputIsDeliveryTripValid =>
      _currentIsDeliveryTripValidStreamController.stream
          .map((isDeliveryTripValid) => isCurrentDeliveryTripValid());

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

  isCurrentDeliveryTripValid() {
    return (deliveryTrip.fromLocation != const LatLng(0, 0) &&
        deliveryTrip.toLocation != const LatLng(0, 0) &&
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

  setCurrentFromLocationAndGov(LatLng currentFromLocation,
      String currentFromGovernment, String addressName) {
    inputCurrentFromLocation.add(addressName);
    deliveryTrip.fromAddressName = addressName;
    deliveryTrip.fromLocation = currentFromLocation;
    deliveryTrip.fromGovernment = currentFromGovernment;

    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentToLocationAndGov(LatLng currentToLocation,
      String currentToGovernment, String addressName) {
    inputCurrentToLocation.add(addressName);
    deliveryTrip.toAddressName = addressName;
    deliveryTrip.toLocation = currentToLocation;
    deliveryTrip.toGovernment = currentToGovernment;

    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripDetails(String currentTripDetails) {
    inputCurrentTripDetails.add(currentTripDetails);
    deliveryTrip.tripDetails = currentTripDetails;
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripStartTime(String currentTripStartTime) {
    inputCurrentTripStartTime.add(currentTripStartTime);
    deliveryTrip.tripTime = currentTripStartTime;
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripExpectedDuration(int currentTripExpectedDuration) {
    inputCurrentTripExpectedDuration.add(currentTripExpectedDuration);
    deliveryTrip.expectedDurationByMin = currentTripExpectedDuration;
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentDeliveryIsTripOneTime(bool currentDeliveryIsTripOneTime) {
    inputCurrentDeliveryIsTripOneTime.add(currentDeliveryIsTripOneTime);
    deliveryTrip.isOneTime = currentDeliveryIsTripOneTime;
    deliveryTrip.tripWeekDays = [];
    inputCurrentTripDays.add(deliveryTrip.tripWeekDays);
    deliveryTrip.tripDay = "";
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripDay(String currentTripDay) {
    deliveryTrip.tripWeekDays = [];
    deliveryTrip.tripWeekDays?.add(currentTripDay);
    deliveryTrip.tripDay = currentTripDay;
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setCurrentTripNewDay(List<String> currentTripDays) {
    deliveryTrip.tripWeekDays = currentTripDays;
    inputCurrentTripDays.add(deliveryTrip.tripWeekDays);
    inputIsCurrentDeliveryTripValid.add(false);
  }

  setNewDeliveryTrip(dynamic context) async {
    loadingState(context: context);
    (await _repository.updateDeliveryTripList(
            UpdateDeliveryTripListRequest(trip: createUpdateRequest())))
        .fold(
            (failure) => {
                  errorState(context: context, message: failure.message),
                }, (data) {
      setToTripList();
      inputDeliveryTrip.add(tripList);
      setCurrentTripDataEmpty();
      hideState(context: context);
    });
  }

  setToTripList() {
    tripList.add(
      DeliveryTripEntity(
        startLoc: deliveryTrip.fromLocation!,
        endLoc: deliveryTrip.toLocation!,
        startState: deliveryTrip.fromGovernment!,
        endState: deliveryTrip.toGovernment!,
        time: deliveryTrip.tripTime!,
        duration: (deliveryTrip.expectedDurationByMin! / 60).toString(),
        day: deliveryTrip.tripDay!,
        id: "0",
      ),
    );
  }

  List<DeliveryTripRequest> createUpdateRequest() {
    List<DeliveryTripRequest> list = tripList
        .map(
          (trip) => DeliveryTripRequest(
            endLoc: CurrentStateRequest(
              type: AppConstants.currentStateTypePoint,
              coordinates: [
                trip.endLoc.latitude,
                trip.endLoc.longitude,
              ],
            ),
            startLoc: CurrentStateRequest(
              type: AppConstants.currentStateTypePoint,
              coordinates: [
                trip.startLoc.latitude,
                trip.startLoc.longitude,
              ],
            ),
            startState: trip.startState,
            endState: trip.endState,
            time: trip.time,
            day: trip.day,
            duration: trip.duration,
          ),
        )
        .toList();

    list.add(DeliveryTripRequest(
      endLoc: CurrentStateRequest(
        type: AppConstants.currentStateTypePoint,
        coordinates: [
          deliveryTrip.toLocation?.latitude ?? 0,
          deliveryTrip.toLocation?.longitude ?? 0,
        ],
      ),
      startLoc: CurrentStateRequest(
        type: AppConstants.currentStateTypePoint,
        coordinates: [
          deliveryTrip.fromLocation?.latitude ?? 0,
          deliveryTrip.fromLocation?.longitude ?? 0,
        ],
      ),
      startState: deliveryTrip.fromGovernment ?? "",
      endState: deliveryTrip.toGovernment ?? "",
      time: deliveryTrip.tripTime ?? "",
      day: deliveryTrip.tripDay ?? "",
      duration: (deliveryTrip.expectedDurationByMin ?? 1 / 60).toString(),
    ));
    return list;
  }

  setCurrentTripDataEmpty() {
    deliveryTrip = DeliveryTripModel(
        fromLocation: const LatLng(0, 0),
        toGovernment: "",
        fromAddressName: "",
        toAddressName: "",
        toLocation: const LatLng(0, 0),
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

  deleteFromTripList(int index) {
    tripList.removeAt(index);
  }

  deleteTrip(dynamic context, int index) async {
    loadingState(context: context);
    (await _repository.deleteDeliveryTripList(index)).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) {
      deleteFromTripList(index);
      inputDeliveryTrip.add(tripList);
      setCurrentTripDataEmpty();
      hideState(context: context);
    });
  }
}
