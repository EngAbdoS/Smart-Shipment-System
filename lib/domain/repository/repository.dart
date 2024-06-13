import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';


abstract class Repository{

  Future<Either<Failure,String>> getSplashNextNavigationRoute();

  Future<Either<Failure, bool>> login(LoginRequest loginRequest);
  Future<Either<Failure, bool>> clientRegistration(ClientRegistrationRequest clientRegistrationRequest);
  Future<Either<Failure, bool>> emailVerification(EmailVerificationRequest emailVerificationRequest);
  Future<Either<Failure, bool>> forgetPassword(String email);

}