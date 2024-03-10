import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseViewModel.dart';
import 'dart:async';

class BaseLoginViewModel
    with BaseLoginViewModelInputs, BaseLoginViewModelOutputs {
  final StreamController _userEmailStreamController = BehaviorSubject<String>();
  final StreamController _passwordStreamController = BehaviorSubject<String>();
  final StreamController _areAllInputsValidStreamController =
      BehaviorSubject<void>();
  final StreamController _isPasswordHiddenStreamController =
      BehaviorSubject<void>();
  final StreamController inputStreamController =
      BehaviorSubject<StateRendererType>();

  // StreamController isUserLoggedInSuccessfullyStreamController =
  // StreamController<bool>();
  // var loginObject = LoginObject("", "");

  bool? _isHidden;
  String? email;
  String? password;

//////////////////////////output//////////////////////////

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsEmailValid => _userEmailStreamController.stream
      .map((userName) => _isEmailValid(userName));

  @override
  Stream<bool> get outputAreAllDataValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => areAllInputsValid());

  @override
  Stream<bool> get outputIsPasswordHidden =>
      _isPasswordHiddenStreamController.stream.map((hidden) => hidden);

//////////////////////////input//////////////////////////

  @override
  Sink get inputValidation => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputPasswordHideState => _isPasswordHiddenStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputEmail => _userEmailStreamController.sink;

//////////////////////////functions//////////////////////////

  setPassword(String password) {
    inputPassword.add(password);

    this.password=password;
    //  loginObject = loginObject.copyWith(password: password);
    inputValidation.add(null);
  }

  setEmail(String email) {
    inputEmail.add(email);
    this.email=email;
    //loginObject = loginObject.copyWith(userName: userName);
    inputValidation.add(null); //
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

  //////////////////////////validation functions//////////////////////////

  bool areAllInputsValid() {

    return _isPasswordValid(password??"")&&_isEmailValid(email??"");

    //return false;
    // return _isUserNameValid(loginObject.userName) &&
    // _isPasswordValid(loginObject.password);
  }

  bool _isPasswordValid(String password) {
    return isPasswordValid(password);
  }

  bool _isEmailValid(String email) {
    return isEmailValid(email);
  }

  //////////////////////////end//////////////////////////

  void dispose() {
    _passwordStreamController.close();
    _userEmailStreamController.close();
    _areAllInputsValidStreamController.close();
    _isPasswordHiddenStreamController.close();
  }
}

abstract mixin class BaseLoginViewModelInputs {
  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputPasswordHideState;

  Sink get inputValidation;
}

abstract mixin class BaseLoginViewModelOutputs {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsPasswordHidden;

  Stream<bool> get outputAreAllDataValid;
}
