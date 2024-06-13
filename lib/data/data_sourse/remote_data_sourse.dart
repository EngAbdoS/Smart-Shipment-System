import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/app_api.dart';
import 'package:smart_shipment_system/data/network/error_handler.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/data/response/response.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, AuthenticationResponse>> login(
      LoginRequest loginRequest);

  Future<Either<Failure, RegistrationResponse>> clientRegistration(
      ClientRegistrationRequest clientRegistrationRequest);

  Future<Either<Failure, EmailVerificationResponse>> emailVerification(EmailVerificationRequest emailVerificationRequest);
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword(String email);



}

class RemoteDataSourceImplementation implements RemoteDataSource {
  RemoteDataSourceImplementation(this._appServiceClient);

  final AppServiceClient _appServiceClient;

  @override
  Future<Either<Failure, AuthenticationResponse>> login(
      LoginRequest loginRequest) async {
    try {
      var result = await _appServiceClient.login(
          loginRequest.email, loginRequest.password);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, RegistrationResponse>> clientRegistration(
      ClientRegistrationRequest clientRegistrationRequest) async {
    try {
      var result = await _appServiceClient.clientRegistration(
          clientRegistrationRequest.name,
          clientRegistrationRequest.email,
          clientRegistrationRequest.phone,
          clientRegistrationRequest.password,
          clientRegistrationRequest.confirmPassword,
          clientRegistrationRequest.role);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, EmailVerificationResponse>> emailVerification(EmailVerificationRequest emailVerificationRequest)async {
    try {
      var result = await _appServiceClient.emailVerification(

          emailVerificationRequest.email,
          emailVerificationRequest.code,
          );
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword(String email) async{
    try {
      var result = await _appServiceClient.forgetPassword(

        email,

      );
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
