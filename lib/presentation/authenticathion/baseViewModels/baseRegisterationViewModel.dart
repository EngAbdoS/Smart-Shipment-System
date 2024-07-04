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
  DateTime? birthDate;
  String? confirmPassword;
  String? firstName;
  String? lastName;
  bool? isGenderMan;
  String? nationalId;
  String? phoneNumber;
  bool? _isConfirmHidden;

//////////////////////////output//////////////////////////

  @override
  Stream<bool> get outputIsAddressValid =>
      _addressStreamController.stream.map((address) => isAddressValid(address));

  @override
  Stream<bool> get outputIsBirthDayValid => _birthDayStreamController.stream
      .map((birthDay) => isBirthDateValid(birthDay));

  @override
  Stream<bool> get outputIsConfirmPasswordValid =>
      _confirmPasswordStreamController.stream
          .map((password) => isConfirmPasswordValid(password));

  @override
  Stream<bool> get outputIsFirstNameValid => _firstNameStreamController.stream
      .map((firstName) => isFirstNameValid(firstName));

  @override
  Stream<bool> get outputIsGenderManValid => _genderManStreamController.stream
      .map((isGenderMan) => _isGenderMan(isGenderMan));

  @override
  Stream<bool> get outputIsLastNameValid => _lastNameStreamController.stream
      .map((lastName) => isLastNameValid(lastName));

  @override
  Stream<bool> get outputIsNationalIdValid => _nationalIdStreamController.stream
      .map((nationalId) => isNationalIdValid(nationalId));

  @override
  Stream<bool> get outputIsPhoneNumberValid =>
      _phoneNumberStreamController.stream
          .map((phoneNumber) => isPhoneNumberValid(phoneNumber));

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
    inputLoginValidation.add(null);
  }

  @override
  setConfirmPassword(String confirmPassword) {
    inputConfirmPassword.add(confirmPassword);
    this.confirmPassword = confirmPassword;
    inputLoginValidation.add(null);
  }

  validateConfirmPassword() {
    confirmPassword == null ? {} : setConfirmPassword(confirmPassword!);
    inputLoginValidation.add(null);
  }

  @override
  setFirstName(String firstName) {
    inputFirstName.add(firstName);
    this.firstName = firstName;
    inputLoginValidation.add(null);
  }

  @override
  setGender(bool isGenderMan) {
    inputGender.add(isGenderMan);
    this.isGenderMan = isGenderMan;
    inputLoginValidation.add(null);
  }

  @override
  setLastName(String lastName) {
    inputLastName.add(lastName);
    this.lastName = lastName;
    inputLoginValidation.add(null);
  }

  @override
  setNationalId(String nationalId) {
    inputNationalId.add(nationalId);
    this.nationalId = nationalId;
    inputLoginValidation.add(null);
  }

  @override
  setPhoneNumber(String phoneNumber) {
    inputPhoneNumber.add(phoneNumber);
    this.phoneNumber = phoneNumber;
    inputLoginValidation.add(null);
  }

  @override
  setBirthDate(DateTime birthDate) {
    inputBirthDay.add(birthDate);
    this.birthDate = birthDate;
    inputLoginValidation.add(null);
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
        isBirthDateValid(birthDate ?? DateTime(0)) &&
        isConfirmPasswordValid(confirmPassword ?? "") &&
        isPhoneNumberValid(phoneNumber ?? "") &&
        isNationalIdValid(nationalId ?? "") &&
        isFirstNameValid(firstName ?? "") &&
        isLastNameValid(lastName ?? "") &&
        isAddressValid(address ?? "") &&
        isGenderMan != null;
  }

  //////////////////////////validation functions//////////////////////////

  bool isConfirmPasswordValid(String confirmPassword) =>
      isPasswordValid(confirmPassword) && super.password == confirmPassword;

  bool isPhoneNumberValid(String phoneNumber) =>
      isEgyptionPhoneNumberValid(phoneNumber);

  bool isNationalIdValid(String nationalId) =>
      isEgyptionNationalIdValid(nationalId);

  bool isAddressValid(String address) => address.isNotEmpty;

  bool isFirstNameValid(String firstName) => firstName.isNotEmpty;

  bool isLastNameValid(String lastName) => lastName.isNotEmpty;

  bool isBirthDateValid(DateTime birthDay) =>
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
