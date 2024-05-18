import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/data/data_sourse/local_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/remote_data_sourse.dart';
import 'package:smart_shipment_system/data/mappers/mappers.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';

import '../network/error_handler.dart';

class RepositoryImplementation implements Repository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  RepositoryImplementation(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, String>> getSplashNextNavigationRoute() async {
    //TODO check if logged in from backend 🤨
    // return const Right(Routes.onBoardingViewRoute);

//handle in local domain

    if (!_localDataSource.isOnBoardingViewed()) {
      return const Right(Routes.onBoardingViewRoute);
    } else {
      if (_localDataSource.isUserLoggedIn()) {
        if (_localDataSource.getUserRole() == AppConstants.userRoleClient) {
          return const Right(Routes.clientHomeRoute);
        } else if (_localDataSource.getUserRole() ==
            AppConstants.userRoleDelivery) {
          return const Right(Routes.deliveryHomeRoute);
        }
      } else {
        return const Right(Routes.loginViewRoute);
      }
    }
    return const Right(Routes.noRoute);
  }

  @override
  Future<Either<Failure, UserModel>> login(LoginRequest loginRequest) async {
    (await _remoteDataSource.login(loginRequest)).fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        var userData = response.data?.userData?.toDomain();
        _localDataSource.setUserLogin(response.token ?? "no token", userData!);
        _localDataSource.setUserRole(
            response.data?.userData?.role ?? AppConstants.userRoleNoRole);
        return Right(userData);
      } else {
        return Left(Failure(response.status ?? ResponseMessage.DEFAULT,
            ApiInternalStatus.FAILURE));
      }
    });
    return Left(Failure(ResponseMessage.DEFAULT, ApiInternalStatus.FAILURE));

    //   final response = await _remoteDataSource.login(loginRequest);
    //   if(response is AuthenticationResponse )
    //     {
    //
    //       if (response.status == ApiInternalStatus.SUCCESS) {
    //         return Right(response.toDomain());
    //       } else {
    //         return left(Failure(response.message ?? ResponceMessage.DEFAULT,
    //             ApiInternalStatus.FAILURE));
    //       }
    //     }
    //
    //
    // } catch (error) {
    //   return Left(ErrorHandler.handle(error).failure);
    // }
  }
}
