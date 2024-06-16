import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/client/home/view/clientHomeView.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import '../../../widgets/loadingState.dart';

class MainClientViewModel {
  final Repository _repository;

  UserModel? userModel;

  final StreamController _mainStream = BehaviorSubject<Widget?>();
  int pageViewIndex = 0;

  MainClientViewModel(this._repository);

  Stream<Widget?> get outputMainStream =>
      _mainStream.stream.map((widget) => widget);

  Sink get inputMainStream => _mainStream.sink;

  List<Widget> widgetList = [const ClientHomeView()];

  List widgetInitialization(UserModel userData) =>
      [initClientHomeModule(userData)];

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
    pageViewIndex = widget;
    await getUserData(context).then((userModel) {
      widgetInitialization(this.userModel!)[widget];
      inputMainStream.add(widgetList[widget]);
    });
  }
}
