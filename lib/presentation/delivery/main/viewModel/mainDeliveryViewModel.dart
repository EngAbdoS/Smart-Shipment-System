import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/delivery/home/view/deliveryView.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import '../../../widgets/loadingState.dart';

class MainDeliveryViewModel {
  MainDeliveryViewModel(this._repository);

  final Repository _repository;
  UserModel? userModel;
  int pageViewIndex = 0;

  final StreamController _mainStream = BehaviorSubject<Widget?>();
  final StreamController _mainIndexStream = BehaviorSubject<int?>();

  Stream<Widget?> get outputMainStream =>
      _mainStream.stream.map((widget) => widget);

  Stream<int?> get outputMainIndexStream =>
      _mainIndexStream.stream.map((index) => index);

  Sink get inputMainStream => _mainStream.sink;

  Sink get inputMainIndexStream => _mainIndexStream.sink;

  void start(dynamic context) async {
    await changeWidget(context, pageViewIndex);
  }

  Future getUserData(dynamic context) async {
    loadingState(context: context);
    (await _repository.getUserData()).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) {
      userModel = data;

      hideState(context: context);
    });
  }

  changeWidget(dynamic context, int widget) async {
    if (pageViewIndex != widget || widget == 0) {
      switch (widget) {
        // case 0:
        //   {
        //     pageViewIndex = widget;
        //     await getUserData(context);
        //     initClientHomeModule(userModel!);
        //     inputMainStream.add(const ClientHomeView());
        //     inputMainIndexStream.add(widget);
        //     break;
        //   }
        // case 1:
        //   {
        //     pageViewIndex = widget;
        //     initClientHomeModule(userModel!);
        //     inputMainStream.add(ShipmentView());
        //     inputMainIndexStream.add(widget);
        //     break;
        //   }
        case 0:
          {
            await getUserData(context);
            pageViewIndex = widget;
            initDeliveryHomeModule(userModel!);
            inputMainStream.add(DeliveryHomeView());
            inputMainIndexStream.add(widget);
            break;
          }
      }
    }
  }

  void dispose() {
    _mainStream.close();
    _mainIndexStream.close();
  }
}
