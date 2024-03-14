import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';

class ForgotPasswordViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final StreamController _emailStreamController = BehaviorSubject<String>();
  String? email;

  void dispose() {
    _emailStreamController.close();
  }

  @override
  forgotPassword(dynamic context) async {
    GoRouter.of(context).push(Routes.changePasswordViewRoute);
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
  }

  bool _isEmailValid(String email) {
    return isEmailValid(email);
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
