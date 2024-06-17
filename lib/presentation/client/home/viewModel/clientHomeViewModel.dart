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

class ClientHomeViewModel extends MainClientViewModel{
  ClientHomeViewModel(this._repository,this.userHomeData) : super(_repository) ;


  UserModel userHomeData;
  final Repository _repository;
  bool isActiveShipmentListExpanded = true;
  final StreamController _activeShipmentListStreamController =
      BehaviorSubject<int?>();

  Stream<int?> get outputActiveShipmentList =>
      _activeShipmentListStreamController.stream
          .map((activeShipmentList) => activeShipmentList);

  Sink get inputActiveShipmentList => _activeShipmentListStreamController.sink;

  startHomeView() {
    seeMore();
  }

  void seeMore() {
    isActiveShipmentListExpanded
        ? activeShipmentList.length >= 3
            ? inputActiveShipmentList.add(3)
            : inputActiveShipmentList.add(activeShipmentList.length)
        : inputActiveShipmentList.add(activeShipmentList.length);
    isActiveShipmentListExpanded = !isActiveShipmentListExpanded;
  }

  List<ShipmentModel> activeShipmentList = [
    ShipmentModel(
      id: "5266911",
      date: "211c 5 5 ",
      type: 'rtyfuygfd',
      recipentName: 'gdfgdsfg',
      reciepentPhone: 'fdgegdfsg',
      senderName: 'gfdfgsd',
      senderPhone: 'sgsgsgsggs',
      startLoc: LatLng(0, 0),
      currentLoc: LatLng(0, 0),
      endLoc: LatLng(0, 0),
      endLocation: 'sgsgsgs',
      weight: 'gskg',
      quantity: 0,
      description: 'AEFAREGREGDS',
    ),
    ShipmentModel(
      id: "5266911",
      date: "211c 5 5 ",
      type: 'rtyfuygfd',
      recipentName: 'gdfgdsfg',
      reciepentPhone: 'fdgegdfsg',
      senderName: 'gfdfgsd',
      senderPhone: 'sgsgsgsggs',
      startLoc: LatLng(0, 0),
      currentLoc: LatLng(0, 0),
      endLoc: LatLng(0, 0),
      endLocation: 'sgsgsgs',
      weight: 'gskg',
      quantity: 0,
      description: 'AEFAREGREGDS',
    ),
    ShipmentModel(
      id: "5266911",
      date: "211c 5 5 ",
      type: 'rtyfuygfd',
      recipentName: 'gdfgdsfg',
      reciepentPhone: 'fdgegdfsg',
      senderName: 'gfdfgsd',
      senderPhone: 'sgsgsgsggs',
      startLoc: LatLng(0, 0),
      currentLoc: LatLng(0, 0),
      endLoc: LatLng(0, 0),
      endLocation: 'sgsgsgs',
      weight: 'gskg',
      quantity: 0,
      description: 'AEFAREGREGDS',
    ),
    ShipmentModel(
      id: "5266911",
      date: "211c 5 5 ",
      type: 'rtyfuygfd',
      recipentName: 'gdfgdsfg',
      reciepentPhone: 'fdgegdfsg',
      senderName: 'gfdfgsd',
      senderPhone: 'sgsgsgsggs',
      startLoc: LatLng(0, 0),
      currentLoc: LatLng(0, 0),
      endLoc: LatLng(0, 0),
      endLocation: 'sgsgsgs',
      weight: 'gskg',
      quantity: 0,
      description: 'AEFAREGREGDS',
    ),
    ShipmentModel(
      id: "5266911",
      date: "211c 5 5 ",
      type: 'rtyfuygfd',
      recipentName: 'gdfgdsfg',
      reciepentPhone: 'fdgegdfsg',
      senderName: 'gfdfgsd',
      senderPhone: 'sgsgsgsggs',
      startLoc: LatLng(0, 0),
      currentLoc: LatLng(0, 0),
      endLoc: LatLng(0, 0),
      endLocation: 'sgsgsgs',
      weight: 'gskg',
      quantity: 0,
      description: 'AEFAREGREGDS',
    ),
  ];
}
