import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/data/data_sourse/cache_data_sourse.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';

abstract class LocalDataSource {
  bool isUserLoggedIn();

  String getUserRole();

  bool isOnBoardingViewed();

  void setUserLogin(String token, UserModel userData);

  void setUserToken(String token);

  void setUserRole(String userRole);

  void saveUserDataToCache(UserModel userData);

  void setOnBoardingVied();
  //TODO get user data
// checks is cache data valid if not call remote data source
}

class LocalDataSourceImplementation implements LocalDataSource {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final CacheDataSource _cacheDataSource = instance<CacheDataSource>();

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
    _appPreferences.setOnBoardingScreenViewed();
  }

  @override
  void setUserLogin(String token, UserModel userData) {
    setUserToken(token);
    saveUserDataToCache(userData);
    _appPreferences.setLoggedIn();
  }

  @override
  void setUserRole(String userRole) {
    _appPreferences.setUserRole(userRole);
  }

  @override
  void setUserToken(String token) {
    _appPreferences.setUserToken(token);
  }

  @override
  void saveUserDataToCache(UserModel userData) {
    _cacheDataSource.putDataToCache(CACHE_USER_DATA_KEY, userData);
  }
}
