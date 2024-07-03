import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/domain/entities/deliveryOrderIntity.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class ActivitiesHistoryViewModel extends MainDeliveryViewModel {
  ActivitiesHistoryViewModel(this._repository, this.userHomeData)
      : super(_repository);

  UserModel userHomeData;
  List<DeliveryOrderEntity> ordersList = [];
  final Repository _repository;

  final StreamController _deliveredOrdersListStreamController =
      BehaviorSubject<List<DeliveryOrderEntity>?>();

  Stream<List<DeliveryOrderEntity>?> get outputOrdersList =>
      _deliveredOrdersListStreamController.stream
          .map((ordersList) => ordersList);

  Sink get inputDeliveredOrdersList =>
      _deliveredOrdersListStreamController.sink;

  startHomeView(dynamic context) async {
    await getAllDeliveredShipments(context);
  }

  Future getAllDeliveredShipments(dynamic context) async {
    loadingState(context: context);
    (await _repository.getAllDeliveredOrders()).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) async {
      ordersList = data;
      inputDeliveredOrdersList.add(ordersList);
      hideState(context: context);
    });
  }

  changeOrderStatus(dynamic context)

  {}
}
