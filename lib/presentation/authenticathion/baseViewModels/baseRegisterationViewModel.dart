import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseLoginViewModel.dart';

class BaseRegistrationViewModel extends BaseLoginViewModel
    with BaseRegistrationViewModelInputs, BaseRegistrationViewModelOutputs {
  final StreamController _addressStreamController = BehaviorSubject<String>();
  final StreamController _birthDayStreamController =
      BehaviorSubject<DateTime>();
  final StreamController _confirmPasswordStreamController =
      BehaviorSubject<String>();
  final StreamController _firstNameStreamController = BehaviorSubject<String>();
  final StreamController _lastNameStreamController = BehaviorSubject<String>();
  final StreamController _genderManStreamController = BehaviorSubject<bool>();
  final StreamController _nationalIdStreamController =
      BehaviorSubject<String>();
  final StreamController _phoneNumberStreamController =
      BehaviorSubject<String>();
  final StreamController _isConfirmPasswordHiddenStreamController =
      BehaviorSubject<void>();

////////////////////////////////////////////////////////////////
//BaseLoginViewModel have email & password & its validations
////////////////////////////////////////////////////////////////
//**************************************************************
//////////////////////////declarations//////////////////////////

  String? address;
  DateTime? birthDate ;//= DateTime.utc(0, 0, 0);
  String? confirmPassword;
  String? firstName;
  String? lastName;
  bool? isGenderMan;
  String? nationalId;
  String? phoneNumber;
  bool? _isConfirmHidden;

//////////////////////////output//////////////////////////

  @override
  Stream<bool> get outputIsAddressValid => _addressStreamController.stream
      .map((address) => _isAddressValid(address));

  @override
  Stream<bool> get outputIsBirthDayValid => _birthDayStreamController.stream
      .map((birthDay) => _isBirthDateValid(birthDay));

  @override
  Stream<bool> get outputIsConfirmPasswordValid =>
      _confirmPasswordStreamController.stream
          .map((password) => _isConfirmPasswordValid(password));

  @override
  Stream<bool> get outputIsFirstNameValid => _firstNameStreamController.stream
      .map((firstName) => _isFirstNameValid(firstName));

  @override
  Stream<bool> get outputIsGenderManValid => _genderManStreamController.stream
      .map((isGenderMan) => _isGenderMan(isGenderMan));

  @override
  Stream<bool> get outputIsLastNameValid => _lastNameStreamController.stream
      .map((lastName) => _isLastNameValid(lastName));

  @override
  Stream<bool> get outputIsNationalIdValid => _nationalIdStreamController.stream
      .map((nationalId) => _isNationalIdValid(nationalId));

  @override
  Stream<bool> get outputIsPhoneNumberValid =>
      _phoneNumberStreamController.stream
          .map((phoneNumber) => _isPhoneNumberValid(phoneNumber));

  @override
  Stream<bool> get outputIsConfirmPasswordHidden =>
      _isConfirmPasswordHiddenStreamController.stream.map((hidden) => hidden);

//////////////////////////input//////////////////////////

  @override
  Sink get inputAddress => _addressStreamController.sink;

  @override
  Sink get inputBirthDay => _birthDayStreamController.sink;

  @override
  Sink get inputConfirmPassword => _confirmPasswordStreamController.sink;

  @override
  Sink get inputFirstName => _firstNameStreamController.sink;

  @override
  Sink get inputGender => _genderManStreamController.sink;

  @override
  Sink get inputLastName => _lastNameStreamController.sink;

  @override
  Sink get inputNationalId => _nationalIdStreamController.sink;

  @override
  Sink get inputPhoneNumber => _phoneNumberStreamController.sink;

  @override
  Sink get inputConfirmPasswordHideState =>
      _isConfirmPasswordHiddenStreamController.sink;

//////////////////////////functions//////////////////////////

  @override
  setAddress(String address) {
    inputAddress.add(address);
    this.address = address;
    inputValidation.add(null);
  }

  // @override
  // setBirthDay(int day) {
  //   birthDate = birthDate.copyWith(day: day);
  //   inputBirthDay.add(birthDate);
  //   inputValidation.add(null);
  // }
  //
  // @override
  // setBirthMonth(int month) {
  //   birthDate = birthDate.copyWith(month: month);
  //   inputBirthDay.add(birthDate);
  //   inputValidation.add(null);
  // }
  //
  // @override
  // setBirthYear(int year) {
  //   birthDate = birthDate.copyWith(year: year);
  //   inputBirthDay.add(birthDate);
  //   inputValidation.add(null);
  // }

  @override
  setConfirmPassword(String confirmPassword) {
    inputConfirmPassword.add(confirmPassword);
    this.confirmPassword = confirmPassword;
    inputValidation.add(null);
  }

  validateConfirmPassword() {
    confirmPassword == null ? {} : setConfirmPassword(confirmPassword!);
    inputValidation.add(null);
  }

  @override
  setFirstName(String firstName) {
    inputFirstName.add(firstName);
    this.firstName = firstName;
    inputValidation.add(null);
  }

  @override
  setGender(bool isGenderMan) {
    inputGender.add(isGenderMan);
    this.isGenderMan = isGenderMan;
    inputValidation.add(null);
  }

  @override
  setLastName(String lastName) {
    inputLastName.add(lastName);
    this.lastName = lastName;
    inputValidation.add(null);
  }

  @override
  setNationalId(String nationalId) {
    inputNationalId.add(nationalId);
    this.nationalId = nationalId;
    inputValidation.add(null);
  }

  @override
  setPhoneNumber(String phoneNumber) {
    inputPhoneNumber.add(phoneNumber);
    this.phoneNumber = phoneNumber;
    inputValidation.add(null);
  }
  @override
  setBirthDate(DateTime birthDate) {
   inputBirthDay.add(birthDate);
   this.birthDate=birthDate;
   inputValidation.add(null);

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
  bool areAllInputsValid() {
    return super.areAllInputsValid() &&
        _isBirthDateValid(birthDate??DateTime(0)) &&
        _isConfirmPasswordValid(confirmPassword ?? "") &&
        _isPhoneNumberValid(phoneNumber ?? "") &&
        _isNationalIdValid(nationalId ?? "") &&
        _isFirstNameValid(firstName ?? "") &&
        _isLastNameValid(lastName ?? "") &&
        _isAddressValid(address ?? "") &&
        isGenderMan != null ;
  }

  //////////////////////////validation functions//////////////////////////

  bool _isConfirmPasswordValid(String confirmPassword) =>
      isPasswordValid(confirmPassword) && super.password == confirmPassword;

  bool _isPhoneNumberValid(String phoneNumber) =>
      isEgyptionPhoneNumberValid(phoneNumber);

  bool _isNationalIdValid(String nationalId) =>
      isEgyptionNationalIdValid(nationalId);

  bool _isAddressValid(String address) => address.isNotEmpty;

  bool _isFirstNameValid(String firstName) => firstName.isNotEmpty;

  bool _isLastNameValid(String lastName) => lastName.isNotEmpty;

  bool _isBirthDateValid(DateTime birthDay) =>
      birthDay.year != 0 && birthDay.month != 0 && birthDay.day != 0;

  bool _isGenderMan(bool isGenderMan) => isGenderMan == true;

//////////////////////////end//////////////////////////

  @override
  void dispose() {
    _addressStreamController.close();
    _birthDayStreamController.close();
    _confirmPasswordStreamController.close();
    _firstNameStreamController.close();
    _lastNameStreamController.close();
    _genderManStreamController.close();
    _nationalIdStreamController.close();
    _phoneNumberStreamController.close();
    _isConfirmPasswordHiddenStreamController.close();
    super.dispose();
  }


}

abstract mixin class BaseRegistrationViewModelInputs {
  Sink get inputFirstName;

  Sink get inputLastName;

  Sink get inputNationalId;

  Sink get inputPhoneNumber;

  Sink get inputAddress;

  Sink get inputConfirmPassword;

  Sink get inputGender;

  Sink get inputBirthDay;

  Sink get inputConfirmPasswordHideState;

  setAddress(String address);

  setFirstName(String firstName);

  setLastName(String lastName);

  setPhoneNumber(String phoneNumber);

  setConfirmPassword(String confirmPassword);

  setNationalId(String nationalId);

setBirthDate(DateTime birthDate);
  // setBirthDay(int day);
  //
  // setBirthYear(int year);
  //
  // setBirthMonth(int month);

  setGender(bool isGenderMan);
}

abstract mixin class BaseRegistrationViewModelOutputs {
  Stream<bool> get outputIsFirstNameValid;

  Stream<bool> get outputIsLastNameValid;

  Stream<bool> get outputIsNationalIdValid;

  Stream<bool> get outputIsPhoneNumberValid;

  Stream<bool> get outputIsAddressValid;

  Stream<bool> get outputIsConfirmPasswordValid;

  Stream<bool> get outputIsGenderManValid;

  Stream<bool> get outputIsBirthDayValid;

  Stream<bool> get outputIsConfirmPasswordHidden;
}
