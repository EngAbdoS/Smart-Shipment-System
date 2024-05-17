// import 'package:dartz/dartz.dart';
// import 'package:smart_shipment_system/app/dependancy_injection.dart';
// import 'package:smart_shipment_system/data/network/failure.dart';
// import 'package:smart_shipment_system/domain/repository/repository.dart';
// import 'package:smart_shipment_system/domain/use_cases/base_use_case.dart';
//
// class LoginUseCase implements BaseUseCase<LoginUseCaseInput, NoParam> {
// final Repository _repository=instance<Repository>();
//   LoginUseCase();
//
//   @override
//   Future<Either<Failure, NoParam>> execute(
//       LoginUseCaseInput input) async {
//     return Failure();
//    // return await _repository.login(LoginRequest(input.email, input.password));
//   }
// }
//
//
// class LoginUseCaseInput {
//   String email;
//   String password;
//
//   LoginUseCaseInput(this.email, this.password);
// }
//
