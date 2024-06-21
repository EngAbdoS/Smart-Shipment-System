import 'dart:async';

import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/authenticathion/verification/getEmailVerification.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
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
  final StreamController _notificationSwitchStream = BehaviorSubject<bool?>();

  Stream<bool?> get outputNotificationSwitchStream =>
      _notificationSwitchStream.stream.map((value) => value);

  Sink get inputNotificationSwitchStream => _notificationSwitchStream.sink;

  Future<void> editProfileData() async {
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
  }

  Future<void> forgotPassword(dynamic context) async {
    dynamic stateContext = context;
    loadingState(context: stateContext);
    (await _repository.forgetPassword(userProfileData.email)).fold(
      (failure) => {
        errorState(context: context, message: failure.message),
      },
      (data) => data
          ? {
              hideState(context: context),
              getEmailVerification(
                  context: context,
                  email: userProfileData.email,
                  nextActionRoute: Routes.changePasswordViewRoute,
                  executeOrRouteOnly: false),
              toastWidgetC(context, AppStrings.otp_sent),
            }
          : {
              errorState(
                context: context,
              ),
            },
    );
  }
}
