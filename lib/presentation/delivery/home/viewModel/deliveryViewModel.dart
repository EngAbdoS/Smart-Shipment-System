import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class DeliveryHomeViewModel extends MainDeliveryViewModel {
  DeliveryHomeViewModel(this._repository, this.userHomeData)
      : super(_repository);

  UserModel userHomeData;
  int fetchPageIndex = 1;
  List<ShipmentModel> ordersList = [];
  final Repository _repository;
  final StreamController _ordersListStreamController =
      BehaviorSubject<List<ShipmentModel>?>();

  Stream<List<ShipmentModel>?> get outputOrdersList =>
      _ordersListStreamController.stream.map((ordersList) => ordersList);

  Sink get inputOrdersList => _ordersListStreamController.sink;

  startHomeView(dynamic context) async {
    fetchPageIndex = 1;
    await getAllShipments(context);
  }

  Future getAllShipments(dynamic context) async {
    loadingState(context: context);
    (await _repository.deliveryGetOrders(fetchPageIndex)).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) async {
      ordersList.addAll(data);
      data.isNotEmpty ? fetchPageIndex++ : null;
      inputOrdersList.add(ordersList);
      hideState(context: context);
    });
  }





}
