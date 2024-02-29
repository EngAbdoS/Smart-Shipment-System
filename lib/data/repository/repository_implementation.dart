import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/data/data_sourse/local_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/remote_data_sourse.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';

class RepositoryImplementation implements Repository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  RepositoryImplementation(this._localDataSource, this._remoteDataSource);

  @override
  Future<String> getSplashNextNavigationRoute() async {
    //TODO check if logged in from backend 🤨

//handle in local domain

    if (!_localDataSource.isOnBoardingViewed()) {
      return Routes.splashRoute;
    } else {
      if (_localDataSource.isUserLoggedIn()) {
        if (_localDataSource.getUserRole() == AppConstants.userRoleClient) {
          return Routes.clientHomeRoute;
        } else if (_localDataSource.getUserRole() ==
            AppConstants.userRoleDelivery) {
          return Routes.deliveryHomeRoute;
        }
      } else {
        return Routes.loginViewRoute;
      }
    }
    return Routes.noRoute;
  }
}
