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
  String searchId = '';
  bool isActiveShipment = true;

  final StreamController _activeShipmentListStreamController =
      BehaviorSubject<int?>();
  final StreamController _deliveredShipmentListStreamController =
      BehaviorSubject<int?>();
  final StreamController _shipmentListStatusBarStreamController =
      BehaviorSubject<bool?>();
  final StreamController _shipmentListStreamController =
      BehaviorSubject<List<ShipmentModel>?>();
  final StreamController _isHomeActiveShipmentOrSearchStream =
      BehaviorSubject<bool?>();

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

  Stream<bool?> get outputIsHomeActiveShipmentOrSearchStream =>
      _isHomeActiveShipmentOrSearchStream.stream.map((widget) => widget);

  Sink get inputShipmentList => _shipmentListStreamController.sink;

  Sink get inputActiveShipmentList => _activeShipmentListStreamController.sink;

  Sink get inputDeliveredShipmentList =>
      _deliveredShipmentListStreamController.sink;

  Sink get inputIsShipmentListStatusBarActive =>
      _shipmentListStatusBarStreamController.sink;

  Sink get inputIsHomeActiveShipmentOrSearchStream =>
      _isHomeActiveShipmentOrSearchStream.sink;

  changeHomeActiveShipmentOrSearchState(bool state) =>
      inputIsHomeActiveShipmentOrSearchStream.add(state);

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
    changeHomeActiveShipmentOrSearchState(true);
    await getHomeActiveShipmentList(context);
  }

  setSearchId(String id) =>
      id == "" || id == " " ? onSearchClose() : searchId = id;

  Future<void> searchShipmentById(dynamic context) async {
    loadingState(context: context);
    changeHomeActiveShipmentOrSearchState(false);
    (await _repository.getShipmentById(searchId)).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) async {
      inputShipmentList.add([data]);
      hideState(context: context);
    });
  }

  void onSearchClose() => {
        changeHomeActiveShipmentOrSearchState(true),
        inputShipmentList
            .add(isActiveShipment ? activeShipmentList : deliveredShipmentList)
      };

  getHomeActiveShipmentList(dynamic context) async {
    await getAllShipments(context);
    seeMore(activeShipmentList.length);
    isActiveShipment = true;
  }

  getActiveShipmentList(dynamic context) async {
    await getAllShipments(context);
    changeShipmentListStatusBar(true);
    inputShipmentList.add(activeShipmentList);
    isActiveShipment = true;
  }

  getDeliveredShipmentList(dynamic context) async {
    await getAllShipments(context);
    inputShipmentList.add(deliveredShipmentList);
    isActiveShipment = false;
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
