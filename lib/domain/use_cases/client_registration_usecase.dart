import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/base_use_case.dart';

class ClientRegistrationUseCase
    implements BaseUseCase<ClientRegistrationUseCaseInput, bool> {
  final Repository _repository;

  ClientRegistrationUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(
      ClientRegistrationUseCaseInput input) async {
    return await _repository.clientRegistration(ClientRegistrationRequest(
        name: input.userName,
        phone: input.phone,
        email: input.email,
        password: input.password,
        confirmPassword: input.confirmPassword,
        role: input.role));
  }
}

class ClientRegistrationUseCaseInput {
  String userName;
  String phone;
  String email;
  String password;
  String confirmPassword;
  String role;

  ClientRegistrationUseCaseInput(
      {required this.userName,
      required this.phone,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.role});
}
