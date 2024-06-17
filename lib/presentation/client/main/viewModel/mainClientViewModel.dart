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

  List<Widget> widgetList() => [ClientHomeView()];

  List<Function> widgetInitialization = [initClientHomeModule];

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
    await getUserData(context);
//widget==0?initClientHomeModule(userModel!):{};
    widgetInitialization[widget](userModel!);

    inputMainStream.add(widgetList()[widget]);
  }
}
