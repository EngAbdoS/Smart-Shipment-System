import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class ChangePasswordViewModel
    with ChangePasswordViewModelInputs, ChangePasswordViewModelOutputs {
  final StreamController _passwordStreamController = BehaviorSubject<String>();
  final StreamController _isPasswordHiddenStreamController =
      BehaviorSubject<void>();
  final StreamController _confirmPasswordStreamController =
      BehaviorSubject<String>();
  final StreamController _isConfirmPasswordHiddenStreamController =
      BehaviorSubject<void>();

  final String otp;
  final Repository repository;

  ChangePasswordViewModel(this.repository, this.otp);

  String? password;
  String? confirmPassword;
  bool? _isHidden;
  bool? _isConfirmHidden;

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsPasswordHidden =>
      _isPasswordHiddenStreamController.stream.map((hidden) => hidden);

  @override
  Stream<bool> get outputIsConfirmPasswordValid =>
      _confirmPasswordStreamController.stream
          .map((password) => isConfirmPasswordValid());

  @override
  Stream<bool> get outputIsConfirmPasswordHidden =>
      _isConfirmPasswordHiddenStreamController.stream.map((hidden) => hidden);

  @override
  Sink get inputPasswordHideState => _isPasswordHiddenStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputConfirmPassword => _confirmPasswordStreamController.sink;

  @override
  Sink get inputConfirmPasswordHideState =>
      _isConfirmPasswordHiddenStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);

    this.password = password;
  }

  changePasswordState() {
    if (_isHidden == true || _isHidden == null) {
      _isHidden = false;
      _isPasswordHiddenStreamController.add(false);
    } else {
      _isHidden = true;
      _isPasswordHiddenStreamController.add(true);
    }
  }

  changeConfirmPasswordState() {
    if (_isConfirmHidden == true || _isConfirmHidden == null) {
      _isConfirmHidden = false;
      _isConfirmPasswordHiddenStreamController.add(false);
    } else {
      _isConfirmHidden = true;
      _isConfirmPasswordHiddenStreamController.add(true);
    }
  }

  @override
  setConfirmPassword(String confirmPassword) {
    inputConfirmPassword.add(confirmPassword);
    this.confirmPassword = confirmPassword;
  }

  validateConfirmPassword() {
    confirmPassword == null ? {} : setConfirmPassword(confirmPassword!);
  }

  bool _isPasswordValid(String password) {
    return isPasswordValidGlobal(password);
  }

  bool isConfirmPasswordValid() =>
      isPasswordValidGlobal(confirmPassword ?? "") &&
      password == confirmPassword;

  void dispose() {
    _passwordStreamController.close();
    _confirmPasswordStreamController.close();
    _isConfirmPasswordHiddenStreamController.close();
    _isPasswordHiddenStreamController.close();
  }

  @override
  changePassword(context) async {
    loadingState(context: context);
    (await repository.resetPassword(ResetPasswordRequest(
            otp: otp, password: password!, confirmPassword: confirmPassword!)))
        .fold(
      (failure) => {
        errorState(context: context, message: failure.message),
      },
      (data) => data
          ? {
              hideState(context: context),
              GoRouter.of(context).pushReplacement(Routes.loginViewRoute),
              toastWidgetC(context, AppStrings.successVerified),
            }
          : {
              errorState(
                context: context,
              ),
            },
    );
  }
}

abstract mixin class ChangePasswordViewModelInputs {
  Sink get inputPassword;

  Sink get inputPasswordHideState;

  Sink get inputConfirmPassword;

  Sink get inputConfirmPasswordHideState;

  setConfirmPassword(String confirmPassword);

  setPassword(String password);

  changePassword(dynamic context);
}

abstract mixin class ChangePasswordViewModelOutputs {
  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsConfirmPasswordHidden;

  Stream<bool> get outputIsConfirmPasswordValid;

  Stream<bool> get outputIsPasswordHidden;
}
