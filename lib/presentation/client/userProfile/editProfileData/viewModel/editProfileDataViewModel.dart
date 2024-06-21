import 'dart:async';
import 'dart:io';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/functions.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class EditUserProfileViewModel //extends MainClientViewModel
{
  EditUserProfileViewModel(
      this._repository, this.userProfileData); //: super(_repository) ;

  final Repository _repository;
  String? name;
  String? email;
  String? phone;
  String? profileImage;
  UserModel userProfileData;
  Map<String, dynamic> editedDataObject = {};
  final StreamController _nameStreamController = BehaviorSubject<String?>();
  final StreamController _emailStreamController = BehaviorSubject<String?>();
  final StreamController _phoneStreamController = BehaviorSubject<String?>();
  final StreamController _profileImageStreamController =
      BehaviorSubject<String?>();

  Stream<String?> get outputNameStream =>
      _nameStreamController.stream.map((value) => value);

  Stream<String?> get outputEmailStream =>
      _emailStreamController.stream.map((value) => value);

  Stream<String?> get outputPhoneStream =>
      _phoneStreamController.stream.map((value) => value);

  Stream<String?> get outputProfileImageStream =>
      _profileImageStreamController.stream.map((value) => value);

  Sink get inputNameStream => _nameStreamController.sink;

  Sink get inputEmailStream => _emailStreamController.sink;

  Sink get inputPhoneStream => _phoneStreamController.sink;

  Sink get inputProfileImageStream => _profileImageStreamController.sink;

  void start() {
    reSetProfileData();
  }

  Future<void> editProfileData(dynamic context) async {
    loadingState(context: context);

    name != null && name != userProfileData.userName
        ? editedDataObject['name'] = name
        : null;
    email != null && email != userProfileData.email
        ? editedDataObject['email'] = email
        : null;
    phone != null && phone != userProfileData.phoneNumber
        ? editedDataObject['phone'] = phone
        : null;
    profileImage != null && profileImage != userProfileData.profileImage
        ? editedDataObject['profileImage'] = profileImage
        : null; //TODO check for upload
    (await _repository.updateUserData(editedDataObject)).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) {
      userProfileData = data;
      reSetProfileData();
      hideState(context: context);
      toastWidgetC(context, AppStrings.data_saved);
    });
  }

  setEmail(String email) {
    inputEmailStream.add(email);
    this.email = email;
  }

  setName(String name) {
    inputNameStream.add(name);
    this.name = name;
  }

  setPhone(String phone) {
    inputPhoneStream.add(phone);
    this.phone = phone;
  }

  setProfilePicture(File profilePic) {
    inputProfileImageStream.add(profilePic.path);
    profileImage = profilePic.path;
  }

  reSetProfileData() {
    inputEmailStream.add(userProfileData.email);
    inputNameStream.add(userProfileData.userName);
    inputPhoneStream.add(userProfileData.phoneNumber);
    inputProfileImageStream.add(userProfileData.profileImage);
  }

  isAllEditedDataValid() =>
      ((editedDataObject['email'] != null
              ? (editedDataObject['email'] != userProfileData.email &&
                  isEmailValid(editedDataObject['email']))
              : true) &&
          (editedDataObject['name'] != null
              ? (editedDataObject['name'] != userProfileData.userName &&
                  isNameValid(editedDataObject['name']))
              : true) &&
          (editedDataObject['phone'] != null
              ? (editedDataObject['phone'] != userProfileData.phoneNumber &&
                  isPhoneNumberValid(editedDataObject['phone']))
              : true) &&
          (editedDataObject['profileImage'] != null
              ? (editedDataObject['profileImage'] !=
                      userProfileData.profileImage &&
                  isProfilePictureValid(editedDataObject['profileImage']))
              : true)) &&
      (editedDataObject['email'] != null ||
          editedDataObject['name'] != null ||
          editedDataObject['phone'] != null ||
          editedDataObject['profileImage'] != null);

  bool isEmailValid(String email) => isEmailValidGlobal(email);

  bool isPhoneNumberValid(String phoneNumber) =>
      isEgyptionPhoneNumberValid(phoneNumber);

  bool isNameValid(String name) => name.isNotEmpty;

  bool isProfilePictureValid(String profilePicturePath) =>
      //TODO validation
      profilePicturePath.isNotEmpty;
}
