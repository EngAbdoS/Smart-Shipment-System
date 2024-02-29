import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';

abstract class LocalDataSource {
  bool isUserLoggedIn();

  String getUserRole();

  bool isOnBoardingViewed();

  void setUserLogin();

  void setUserRole(String userRole);

  void setOnBoardingVied();
}

class LocalDataSourceImplementation implements LocalDataSource {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  bool isOnBoardingViewed() {
   return _appPreferences.isOnBoardingScreenViewed();
  }

  @override
  bool isUserLoggedIn() {
    return _appPreferences.isLoggedIn();
  }

  @override
  String getUserRole() {
  return _appPreferences.getUserRole();
  }

  @override
  void setOnBoardingVied() {
_appPreferences.setOnBoardingScreenViewed();  }

  @override
  void setUserLogin() {
_appPreferences.setLoggedIn();  }

  @override
  void setUserRole(String userRole) {
_appPreferences.setUserRole(userRole);  }
}
