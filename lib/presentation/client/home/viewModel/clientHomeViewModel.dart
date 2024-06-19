import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class ClientHomeViewModel extends MainClientViewModel {
  ClientHomeViewModel(this._repository, this.userHomeData) : super(_repository);

  UserModel userHomeData;
  final Repository _repository;
  List<ShipmentModel> activeShipmentList = [];
  List<ShipmentModel> deliveredShipmentList = [];
  bool isShipmentListStatusBarActive = true;
  bool isActiveShipmentListExpanded = true;
  final StreamController _activeShipmentListStreamController =
      BehaviorSubject<int?>();
  final StreamController _deliveredShipmentListStreamController =
      BehaviorSubject<int?>();
  final StreamController _shipmentListStatusBarStreamController =
      BehaviorSubject<bool?>();

  Stream<int?> get outputActiveShipmentList =>
      _activeShipmentListStreamController.stream
          .map((activeShipmentList) => activeShipmentList);

  Stream<int?> get outputDeliveredShipmentList =>
      _deliveredShipmentListStreamController.stream
          .map((deliveredShipmentList) => deliveredShipmentList);

  Stream<bool?> get outputIsShipmentListStatusBarActive =>
      _shipmentListStatusBarStreamController.stream.map((status) => status);

  Sink get inputActiveShipmentList => _activeShipmentListStreamController.sink;

  Sink get inputIsShipmentListStatusBarActive =>
      _shipmentListStatusBarStreamController.sink;

  changeShipmentListStatusBar(bool status) {
    isShipmentListStatusBarActive != status
        ? {
            isShipmentListStatusBarActive = status,
            inputIsShipmentListStatusBarActive.add(status)
          }
        : {};
    print(isShipmentListStatusBarActive);
  }

  startHomeView(dynamic context) async {
    await getAllShipments(context);
  }

  Future getAllShipments(dynamic context) async {
    loadingState(context: context);
    (await _repository.getAllShipment()).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) {
      activeShipmentList = data;
      seeMore();
      hideState(context: context);
    });
  }

  void seeMore() => isActiveShipmentListExpanded
      ? {
          activeShipmentList.length >= 3
              ? inputActiveShipmentList.add(3)
              : inputActiveShipmentList.add(activeShipmentList.length),
          isActiveShipmentListExpanded = false,
        }
      : {
          inputActiveShipmentList.add(activeShipmentList.length),
          isActiveShipmentListExpanded = true,
        };

  void dispose() {
    _activeShipmentListStreamController.close();
    _deliveredShipmentListStreamController.close();
  }
}
