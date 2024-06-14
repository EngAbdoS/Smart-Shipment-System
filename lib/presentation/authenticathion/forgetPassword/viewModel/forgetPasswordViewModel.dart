import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/authenticathion/verification/getEmailVerification.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class ForgotPasswordViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final Repository _repository;

  final StreamController _emailStreamController = BehaviorSubject<String>();
  String? email;

  ForgotPasswordViewModel(this._repository);

  void dispose() {
    _emailStreamController.close();
  }

  @override
  forgotPassword(dynamic context) async {
    dynamic stateContext = context;
    loadingState(context: stateContext);
    (await _repository.forgetPassword(email!)).fold(
      (failure) => {
        errorState(context: context, message: failure.message),
      },
      (data) => data
          ? {
              hideState(context: context),
              getEmailVerification(
                  context, email!, Routes.changePasswordViewRoute),
            }
          : {
              errorState(
                context: context,
              ),
            },
    );
  }

  // GoRouter.of(context).push(Routes.changePasswordViewRoute);

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid());

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
  }

  bool isEmailValid() {
    return isEmailValidGlobal(email ?? "");
  }
}

abstract mixin class ForgotPasswordViewModelInputs {
  Sink get inputEmail;

  setEmail(String email);

  forgotPassword(dynamic context);
}

abstract mixin class ForgotPasswordViewModelOutputs {
  Stream<bool> get outputIsEmailValid;
}
