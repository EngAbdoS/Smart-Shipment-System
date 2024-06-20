import 'dart:async';
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
  bool isShipmentListStatusBarActive = false;
  bool isActiveShipmentListExpanded = true;
  final StreamController _activeShipmentListStreamController =
      BehaviorSubject<int?>();
  final StreamController _deliveredShipmentListStreamController =
      BehaviorSubject<int?>();
  final StreamController _shipmentListStatusBarStreamController =
      BehaviorSubject<bool?>();
  final StreamController _shipmentListStreamController =
      BehaviorSubject<List<ShipmentModel>?>();

  Stream<List<ShipmentModel>?> get outputShipmentList =>
      _shipmentListStreamController.stream.map((shipmentList) => shipmentList);

  Stream<int?> get outputActiveShipmentList =>
      _activeShipmentListStreamController.stream
          .map((activeShipmentList) => activeShipmentList);

  Stream<int?> get outputDeliveredShipmentList =>
      _deliveredShipmentListStreamController.stream
          .map((deliveredShipmentList) => deliveredShipmentList);

  Stream<bool?> get outputIsShipmentListStatusBarActive =>
      _shipmentListStatusBarStreamController.stream.map((status) => status);

  Sink get inputShipmentList => _shipmentListStreamController.sink;

  Sink get inputActiveShipmentList => _activeShipmentListStreamController.sink;

  Sink get inputDeliveredShipmentList =>
      _deliveredShipmentListStreamController.sink;

  Sink get inputIsShipmentListStatusBarActive =>
      _shipmentListStatusBarStreamController.sink;

  changeShipmentListStatusBar(bool status) {
    isShipmentListStatusBarActive != status
        ? {
            isShipmentListStatusBarActive = status,
            inputIsShipmentListStatusBarActive.add(status),
            inputShipmentList
                .add(status ? activeShipmentList : deliveredShipmentList),
          }
        : {};
  }

  startHomeView(dynamic context) async {
    await getHomeActiveShipmentList(context);
  }

  getHomeActiveShipmentList(dynamic context) async {
    await getAllShipments(context);
    seeMore(10000);
  }

  getActiveShipmentList(dynamic context) async {
    await getAllShipments(context);
    changeShipmentListStatusBar(true);
    inputShipmentList.add(activeShipmentList);
  }

  getDeliveredShipmentList(dynamic context) async {
    await getAllShipments(context);
    inputShipmentList.add(deliveredShipmentList);
  }

  Future getAllShipments(dynamic context) async {
    loadingState(context: context);
    (await _repository.getAllShipment()).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) async {
      await dataFiltration(data);
      hideState(context: context);
    });
  }

  dataFiltration(List<ShipmentModel> shipmentList) {
    deliveredShipmentList = [];
    activeShipmentList = [];
    for (var shipment in shipmentList) {
      shipment.delivered
          ? deliveredShipmentList.add(shipment)
          : activeShipmentList.add(shipment);
    }
  }

  void seeMore(int length) => length > 3
      ? inputShipmentList.add(activeShipmentList.getRange(0, 3).toList())
      : inputShipmentList.add(activeShipmentList);

  void dispose() {
    _activeShipmentListStreamController.close();
    _deliveredShipmentListStreamController.close();
  }
}
