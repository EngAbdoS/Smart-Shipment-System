import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';

abstract class Repository {
  Future<Either<Failure, String>> getSplashNextNavigationRoute();

  Future<Either<Failure, String>> getLoginNextNavigationRoute();

  Future<Either<Failure, UserModel>> getUserData();
  Future<Either<Failure, List<ShipmentModel>>> getAllShipment();

  Future<Either<Failure, bool>> login(LoginRequest loginRequest);

  Future<Either<Failure, bool>> clientRegistration(
      ClientRegistrationRequest clientRegistrationRequest);

  Future<Either<Failure, bool>> emailVerification(
      EmailVerificationRequest emailVerificationRequest);

  Future<Either<Failure, bool>> forgetPassword(String email);

  Future<Either<Failure, bool>> unorganizedDeliveryRegistration(
      UnorganizedDeliveryRegistrationRequest
      unorganizedDeliveryRegistrationRequest);
  Future<Either<Failure, bool>> fixedDeliveryRegistration(
      FixedDeliveryRegistrationRequest
      fixedDeliveryRegistrationRequest);

  Future<Either<Failure, bool>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);

  void logout();
}
