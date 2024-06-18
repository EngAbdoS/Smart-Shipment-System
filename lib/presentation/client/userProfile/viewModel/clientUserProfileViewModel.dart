import 'dart:async';

import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';

class ClientUserProfileViewModel //extends MainClientViewModel
{
  ClientUserProfileViewModel(
      this._repository, this.userProfileData); //: super(_repository) ;

  final Repository _repository;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  UserModel userProfileData;
  final StreamController _notificationSwitchStream = BehaviorSubject<bool?>();

  Stream<bool?> get outputNotificationSwitchStream =>
      _notificationSwitchStream.stream.map((value) => value);

  Sink get inputNotificationSwitchStream => _notificationSwitchStream.sink;

  void changeNotificationSwitch(bool value) {
    _notificationSwitchStream.sink.add(value);
  }

  changeLanguage(dynamic context) {
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  void logout(dynamic context) {
    _repository.logout();
    GoRouter.of(context).pushReplacement(Routes.loginViewRoute);
  }
}
