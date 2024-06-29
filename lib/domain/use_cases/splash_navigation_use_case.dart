import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/base_use_case.dart';

class SplashNavigationUseCase implements BaseUseCase<dynamic, String> {
  final Repository _repository;

  SplashNavigationUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(dynamic context) async {
    return (await _repository.getSplashNextNavigationRoute(context))
        .fold((failure) => Left(failure), (route) => Right(route));
  }
}
