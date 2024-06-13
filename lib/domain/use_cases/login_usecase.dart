import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/base_use_case.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, bool> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(LoginUseCaseInput input) async {
    return await _repository
        .login(LoginRequest(email: input.email, password: input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput({required this.email, required this.password});
}
