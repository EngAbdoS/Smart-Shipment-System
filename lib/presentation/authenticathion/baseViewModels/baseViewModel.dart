import 'dart:async';

import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  //shard variables and functions that will be used through any view model

  final StreamController _inputStreamController =
      BehaviorSubject<StateRendererType>(); //مسؤل عن الحالة في الاب كله

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<StateRendererType> get outputState =>
      _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); //start view model job

  void dispose(); //will be called when view model dies

  Sink get inputState;
}

abstract mixin class BaseViewModelOutputs {
  Stream<StateRendererType> get outputState;
}

enum StateRendererType {
  //dialog

  popupLoadingState,
  popupErrorState,
  popupSuccessState,

  //general
  contentState,
}
