import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/data/response/response.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/base_use_case.dart';

class ClientRegistrationUseCase
    implements
        BaseUseCase<ClientRegistrationUseCaseInput, RegistrationResponse> {
  final Repository _repository;

  ClientRegistrationUseCase(this._repository);

  @override
  Future<Either<Failure, RegistrationResponse>> execute(
      ClientRegistrationUseCaseInput input) async {
    return await _repository.clientRegistration(ClientRegistrationRequest(
        input.userName,
        input.phone,
        input.email,
        input.password,
        input.confirmPassword,
        input.role));
  }
}

class ClientRegistrationUseCaseInput {
  String userName;
  String phone;
  String email;
  String password;
  String confirmPassword;
  String role;

  ClientRegistrationUseCaseInput(this.userName, this.phone, this.email,
      this.password, this.confirmPassword, this.role);
}
