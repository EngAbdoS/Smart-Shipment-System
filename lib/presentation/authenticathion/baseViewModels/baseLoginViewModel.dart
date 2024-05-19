import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'dart:async';

class BaseLoginViewModel
    with BaseLoginViewModelInputs, BaseLoginViewModelOutputs {
  final StreamController _userEmailStreamController = BehaviorSubject<String>();
  final StreamController _passwordStreamController = BehaviorSubject<String>();
  final StreamController _areAllLoginInputsValidStreamController =
      BehaviorSubject<void>();
  final StreamController _isPasswordHiddenStreamController =
      BehaviorSubject<void>();


  // StreamController isUserLoggedInSuccessfullyStreamController =
  // StreamController<bool>();
  // var loginObject = LoginObject("", "");

  bool? _isHidden;
  String? email;
  String? password;

//////////////////////////output//////////////////////////

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => isPasswordValid(password));

  @override
  Stream<bool> get outputIsEmailValid => _userEmailStreamController.stream
      .map((email) => isEmailValid(email));

  @override
  Stream<bool> get outputAreAllLoginDataValid =>
      _areAllLoginInputsValidStreamController.stream
          .map((_) => areAllInputsValid());

  @override
  Stream<bool> get outputIsPasswordHidden =>
      _isPasswordHiddenStreamController.stream.map((hidden) => hidden);

//////////////////////////input//////////////////////////

  @override
  Sink get inputLoginValidation => _areAllLoginInputsValidStreamController.sink;

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
    inputLoginValidation.add(null);
  }

  setEmail(String email) {
    inputEmail.add(email);
    this.email=email;
    //loginObject = loginObject.copyWith(userName: userName);
    inputLoginValidation.add(null); //
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

    return isPasswordValid(password??"")&&isEmailValid(email??"");

    //return false;
    // return _isUserNameValid(loginObject.userName) &&
    // _isPasswordValid(loginObject.password);
  }

  bool isPasswordValid(String password) {
    return isPasswordValidGlobal(password);
    return true;
  }

  bool isEmailValid(String email) {
    return isEmailValidGlobal(email);
  }

  //////////////////////////end//////////////////////////

  void dispose() {
    _passwordStreamController.close();
    _userEmailStreamController.close();
    _areAllLoginInputsValidStreamController.close();
    _isPasswordHiddenStreamController.close();
  }
}

abstract mixin class BaseLoginViewModelInputs {
  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputPasswordHideState;

  Sink get inputLoginValidation;
}

abstract mixin class BaseLoginViewModelOutputs {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsPasswordHidden;

  Stream<bool> get outputAreAllLoginDataValid;
}
