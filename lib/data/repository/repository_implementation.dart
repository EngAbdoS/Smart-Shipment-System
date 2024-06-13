import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/data/data_sourse/local_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/remote_data_sourse.dart';
import 'package:smart_shipment_system/data/mappers/mappers.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/data/response/response.dart';
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
    return const Right(Routes.loginViewRoute);

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
  Future<Either<Failure, bool>> login(LoginRequest loginRequest) async {
    return await (await _remoteDataSource.login(loginRequest)).fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        _localDataSource.setUserLogin(response.token ?? "no token",
            response.data?.userData?.role ?? AppConstants.userRoleNoRole);
        return Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> clientRegistration(
      ClientRegistrationRequest clientRegistrationRequest) async {
    return await (await _remoteDataSource
            .clientRegistration(clientRegistrationRequest))
        .fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        return Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> emailVerification(EmailVerificationRequest emailVerificationRequest) async{
    return await (await _remoteDataSource
        .emailVerification(emailVerificationRequest))
        .fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        return Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }
}
