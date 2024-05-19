import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/data/response/response.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';

abstract class Repository{

  Future<Either<Failure,String>> getSplashNextNavigationRoute();

  Future<Either<Failure, UserModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, RegistrationResponse>> clientRegistration(ClientRegistrationRequest clientRegistrationRequest);

}