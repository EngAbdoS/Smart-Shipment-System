import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/data/data_sourse/cache_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/remote_data_sourse.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';

abstract class LocalDataSource {
  bool isUserLoggedIn();

  String getUserRole();

  String getUserToken();

  bool isOnBoardingViewed();

  void setUserLogin(String token);

  void setUserToken(String token);

  void setUserRole(String userRole);

  void saveUserDataToCache(UserModel userData);

  void setOnBoardingVied();
//TODO get user data
// checks is cache data valid if not call remote data source
}

class LocalDataSourceImplementation implements LocalDataSource {
  final AppPreferences _appPreferences;

  final CacheDataSource _cacheDataSource;
  final RemoteDataSource _remoteDataSource;

  LocalDataSourceImplementation(
      this._appPreferences, this._cacheDataSource, this._remoteDataSource);

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
  void setUserLogin(String token) {
    setUserToken(token);
    // setUserRole(userRole);
    //saveUserDataToCache(userData);
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

  @override
  String getUserToken() {
    return _appPreferences.getUserToken();
  }
}
