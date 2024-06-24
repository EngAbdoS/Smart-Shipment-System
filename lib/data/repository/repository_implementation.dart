import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/data/data_sourse/local_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/remote_data_sourse.dart';
import 'package:smart_shipment_system/data/mappers/mappers.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
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
    //   return const Right(Routes.loginViewRoute);

    if (!_localDataSource.isOnBoardingViewed()) {
      return const Right(Routes.onBoardingViewRoute);
    } else {
      if (_localDataSource.isUserLoggedIn()) {
        return await (await getLoginNextNavigationRoute()).fold((error) {
          return Left(error);
        }, (route) {
          return Right(route);
        });
        //TODO getHomeRoute
        // if (_localDataSource.getUserRole() == AppConstants.userRoleClient) {
        //   return const Right(Routes.clientHomeRoute);
        // } else if (_localDataSource.getUserRole() ==
        //     AppConstants.userRoleDelivery) {
        //   return const Right(Routes.deliveryHomeRoute);
        // }
      } else {
        return const Right(Routes.loginViewRoute);
      }
    }
    return const Right(Routes.noRoute);
  }

  @override
  Future<Either<Failure, String>> getLoginNextNavigationRoute() async {
    return await (await getUserData()).fold((error) {
      return Left(error);
    }, (data) {
      if (data.role == AppConstants.userRoleClient) {
        return const Right(Routes.mainClientViewRoute);
      } else if (data.role == AppConstants.deliveryRoleExternal) {
        return const Right(Routes.deliveryHomeRoute);
      } else if (data.role == AppConstants.deliveryRoleInternal) {
        return const Right(Routes.deliveryHomeRoute);
      }
      return const Right(Routes.loginViewRoute);
    });
  }

  @override
  Future<Either<Failure, bool>> login(LoginRequest loginRequest) async {
    return await (await _remoteDataSource.login(loginRequest)).fold((error) {
      return Left(error);
    }, (response) async {
      if (response.status == ResponseMessage.SUCCESS) {
        _localDataSource.setUserLogin(response.token ?? "no token");
        await reInitializeDio();
        await _remoteDataSource.reInitAppServiceClient();
        return const Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> updateUserProfileImage(
      String profileImage, String email) async {
    String? imgUrlNew;
    return await (await _remoteDataSource.uploadPhoto(
            profileImage, AppConstants.profilePhotosStorageRef, email))
        .fold((error) {
      return Left(error);
    }, (imgUrl) async {
      imgUrlNew = imgUrl;
      return await (await _remoteDataSource.updateUserProfileImage(imgUrlNew!))
          .fold((error) {
        return Left(error);
      }, (response) async {
        if (response.status == ResponseMessage.SUCCESS) {
          return const Right(true);
        } else {
          return Left(ErrorHandler.handle(response).failure);
        }
      });
    });
  }

  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    return await (await _localDataSource.getUserData()).fold(
        (noLocalData) async {
      return await (await _remoteDataSource.getUserData()).fold((error) {
        return Left(error);
      }, (response) {
        if (response.status == ResponseMessage.SUCCESS) {
          var userData = response.dataResponse?.userResponse.toDomain();
          _localDataSource.saveUserDataToCache(userData!);

          _localDataSource
              .setUserRole(userData.role ?? AppConstants.userRoleNoRole);
          return Right(userData);
        } else {
          return Left(ErrorHandler.handle(response).failure);
        }
      });
    }, (data) => right(data));
  }

  @override
  Future<Either<Failure, UserModel>> updateUserData(
      Map<String, dynamic> data) async {
    String? emailOld;
    (await getUserData()).fold((error) {
      return Left(error);
    }, (data) {
      emailOld = data.email;
    });
    await data['profileImage'] != null
        ? (await updateUserProfileImage(
                data['profileImage'], data['email'] ?? emailOld))
            .fold((error) {
            return Left(error);
          }, (imgUrl) => data.remove('profileImage'))
        : null;
    return await (await _remoteDataSource.updateUserData(data)).fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        var userData = response.dataResponse?.userResponse.toDomain();
        _localDataSource.saveUserDataToCache(userData!);
        return Right(userData);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, List<ShipmentModel>>> getAllShipment() async {
    return await (await _localDataSource.getShipmentList()).fold(
        (noLocalData) async {
      return await (await _remoteDataSource.getAllShipments()).fold((error) {
        return Left(error);
      }, (response) {
        if (response.status == ResponseMessage.SUCCESS) {
          var shipmentList =
              response.data?.orders?.map((order) => order.toDomain()).toList();
          _localDataSource.saveShipmentListToCache(shipmentList ?? []);
          return Right(shipmentList ?? []);
        } else {
          return Left(ErrorHandler.handle(response).failure);
        }
      });
    }, (data) => right(data));
  }

  @override
  Future<Either<Failure, bool>> createShipment(
      CreateShipmentRequest createShipmentRequest) async {
    return await (await _remoteDataSource.createShipment(createShipmentRequest))
        .fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        return const Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, List<ShipmentModel>>> getAllComingOrders() async {
    return await (await _remoteDataSource.getAllComingOrders()).fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        var shipmentList =
            response.data?.orders?.map((order) => order.toDomain()).toList();

        return Right(shipmentList ?? []);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, List<RecommendedDeliveryEntity>>>
      getRecommendedDeliveries(
          GetDeliveriesRequest getDeliveriesRequest) async {
    return await (await _remoteDataSource
            .getRecommendedDeliveries(getDeliveriesRequest))
        .fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        var deliveriesList = response.data?.deliveries
            ?.map((delivery) => delivery.toDomain())
            .toList();
        return Right(deliveriesList ?? []);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, ShipmentModel>> getShipmentById(String id) async {
    return await (await _remoteDataSource.getShipmentById(id)).fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        return Right(response.data!.order!.toDomain());
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
        return const Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> emailVerification(
      EmailVerificationRequest emailVerificationRequest) async {
    return await (await _remoteDataSource
            .emailVerification(emailVerificationRequest))
        .fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        return const Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> forgetPassword(String email) async {
    return await (await _remoteDataSource.forgetPassword(email)).fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        return const Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> unorganizedDeliveryRegistration(
      UnorganizedDeliveryRegistrationRequest
          unorganizedDeliveryRegistrationRequest) async {
    (await _remoteDataSource.uploadPhoto(
            unorganizedDeliveryRegistrationRequest.deliveryApprovalImg,
            AppConstants.deliveryApprovalImageStorageRef,
            unorganizedDeliveryRegistrationRequest.email))
        .fold((error) {
      return Left(error);
    },
            (imgUrl) => unorganizedDeliveryRegistrationRequest
                .deliveryApprovalImg = imgUrl);
    (await _remoteDataSource.uploadPhoto(
            unorganizedDeliveryRegistrationRequest.vehicleLicenseImg,
            AppConstants.vehicleLicenseImageStorageRef,
            unorganizedDeliveryRegistrationRequest.email))
        .fold((error) {
      return Left(error);
    },
            (imgUrl) => unorganizedDeliveryRegistrationRequest
                .vehicleLicenseImg = imgUrl);

    return await (await _remoteDataSource.unorganizedDeliveryRegistration(
            unorganizedDeliveryRegistrationRequest))
        .fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        return const Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> fixedDeliveryRegistration(
      FixedDeliveryRegistrationRequest fixedDeliveryRegistrationRequest) async {
    (await _remoteDataSource.uploadPhoto(
            fixedDeliveryRegistrationRequest.deliveryApprovalImg,
            AppConstants.deliveryApprovalImageStorageRef,
            fixedDeliveryRegistrationRequest.email))
        .fold((error) {
      return Left(error);
    },
            (imgUrl) =>
                fixedDeliveryRegistrationRequest.deliveryApprovalImg = imgUrl);

    return await (await _remoteDataSource
            .fixedDeliveryRegistration(fixedDeliveryRegistrationRequest))
        .fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        return const Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    return await (await _remoteDataSource.resetPassword(resetPasswordRequest))
        .fold((error) {
      return Left(error);
    }, (response) {
      if (response.status == ResponseMessage.SUCCESS) {
        return const Right(true);
      } else {
        return Left(ErrorHandler.handle(response).failure);
      }
    });
  }

  @override
  void logout() {
    _localDataSource.logout();
  }
}
