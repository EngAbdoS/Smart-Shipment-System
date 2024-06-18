import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/client/home/view/clientHomeView.dart';
import 'package:smart_shipment_system/presentation/client/userProfile/view/clientUserProfileView.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import '../../../widgets/loadingState.dart';

class MainClientViewModel {
  MainClientViewModel(this._repository);

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

  List<Widget> widgetList() => [
        const ClientHomeView(),

        Container(
          color: Colors.red,
          child: Center(child: Text("حمرا")),
        ),
        Container(
          color: Colors.red,
          child: Center(child: Text("حمرا")),
        ),
        //Container(color: Colors.red),
        ClientUserProfileView()
      ];

  List<Function> widgetInitialization = [
    initClientHomeModule,
    initClientHomeModule,
    initClientHomeModule,
    initClientProfileModule,
  ];

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
    pageViewIndex = widget;
    await getUserData(context);
    widgetInitialization[widget](userModel!);
    inputMainStream.add(widgetList()[widget]);
    inputMainIndexStream.add(widget);
  }
}
