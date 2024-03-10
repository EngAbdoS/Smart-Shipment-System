import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseLoginViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/login/manager/loginCubitStates.dart';
import 'package:smart_shipment_system/presentation/widgets/testState.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  LoginCubit() : super(LoginInitial());

  final BaseLoginViewModel baseLoginViewModel = instance<BaseLoginViewModel>();
  final StreamController inputStreamController =
      BehaviorSubject<StateRendererType>();

  Sink get inputState => inputStreamController.sink;

  Stream<StateRendererType> get outputState =>
      inputStreamController.stream.map((state) => state);

  // @override
  // login() async {
  //   inputState.add(
  //       LoadingState(stateRendererType: StateRendererType.popupLoadingState));
  //
  //   (await _loginUseCase.execute(
  //       LoginUseCaseInput(loginObject.userName, loginObject.password)))
  //       .fold(
  //           (failure) => {
  //         inputState.add(ErrorState(
  //             StateRendererType.popupErrorState, failure.message))
  //       }, (data) {
  //     _appPreferences.setUserID(data.user!.uid);
  //
  //     inputState.add(ContentState());
  //     isUserLoggedInSuccessfullyStreamController.add(true);
  //   });
  // }

  void getLoading(dynamic context) {
    inputState.add(StateRendererType.popupLoadingState);
    testState(context);
    //emit(LoginLoading(asset: "asset"));
  }

  void getsuccess() {
    emit(LoginSuccess(route: ""));
  }
}
