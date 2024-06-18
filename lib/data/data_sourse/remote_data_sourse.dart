import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/data/network/app_api.dart';
import 'package:smart_shipment_system/data/network/error_handler.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/data/response/response.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, MeDataResponse>> getUserData();
  Future<Either<Failure, OrdersResponse>> getAllShipments();

  Future<Either<Failure, AuthenticationResponse>> login(
      LoginRequest loginRequest);

  Future<Either<Failure, RegistrationResponse>> clientRegistration(
      ClientRegistrationRequest clientRegistrationRequest);

  Future<Either<Failure, RegistrationResponse>> unorganizedDeliveryRegistration(
      UnorganizedDeliveryRegistrationRequest
          unorganizedDeliveryRegistrationRequest);

  Future<Either<Failure, EmailVerificationResponse>> emailVerification(
      EmailVerificationRequest emailVerificationRequest);

  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword(String email);

  Future<Either<Failure, ForgetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);

  Future<Either<Failure, String>> uploadPhoto(
      String imagePath, String refPath, String userEmail);
  reInitAppServiceClient();
}

class RemoteDataSourceImplementation implements RemoteDataSource {
  RemoteDataSourceImplementation(this._appServiceClient, this._firebaseStorage);

  AppServiceClient _appServiceClient;
  final FirebaseStorage _firebaseStorage;

  @override
  reInitAppServiceClient() async{
    _appServiceClient = instance<AppServiceClient>();
  }

  @override
  Future<Either<Failure, MeDataResponse>> getUserData() async {
    try {
      var result = await _appServiceClient.getUserData();
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
  @override
  Future<Either<Failure, OrdersResponse>> getAllShipments()async {
    try {
      print("heerr");
      var result = await _appServiceClient.getAllOrders();
      print(result);
      return Right(result);
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }
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
  Future<Either<Failure, EmailVerificationResponse>> emailVerification(
      EmailVerificationRequest emailVerificationRequest) async {
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
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword(
      String email) async {
    try {
      var result = await _appServiceClient.forgetPassword(
        email,
      );
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, String>> uploadPhoto(
      String imagePath, String refPath, String userEmail) async {
    try {
      var storageRef = _firebaseStorage.ref(refPath).child(userEmail);
      await storageRef.putFile(File(imagePath));
      String url = await storageRef.getDownloadURL();
      return Right(url);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, RegistrationResponse>> unorganizedDeliveryRegistration(
      UnorganizedDeliveryRegistrationRequest
          unorganizedDeliveryRegistrationRequest) async {
    try {
      var result = await _appServiceClient.unorganizedDeliveryRegistration(
          unorganizedDeliveryRegistrationRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    try {
      var result = await _appServiceClient.resetPassword(
          resetPasswordRequest.otp,
          resetPasswordRequest.password,
          resetPasswordRequest.confirmPassword);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }


}
