import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/base_use_case.dart';

class UnorganizedDeliveryRegistrationUseCase
    implements BaseUseCase<UnorganizedDeliveryRegistrationUseCaseInput, bool> {
  final Repository _repository;

  UnorganizedDeliveryRegistrationUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(
      UnorganizedDeliveryRegistrationUseCaseInput input) async {
    return await _repository.unorganizedDeliveryRegistration(
      UnorganizedDeliveryRegistrationRequest(
          name: input.name,
          email: input.email,
          phone: input.phone,
          password: input.password,
          confirmPassword: input.confirmPassword,
          currentState: CurrentStateRequest(
              type: input.type, coordinates: input.coordinates),
          vehicleType: input.vehicleType,
          vehicleLicenseImg: input.vehicleLicenseImg,
          deliveryApprovalImg: input.deliveryApprovalImg,
          role: input.role),
    );
  }
}

class UnorganizedDeliveryRegistrationUseCaseInput {
  String name;
  String phone;
  String email;
  String password;
  String confirmPassword;
  String type;
  List<double> coordinates;
  String vehicleType;
  String vehicleLicenseImg;
  String deliveryApprovalImg;
  String role;

  UnorganizedDeliveryRegistrationUseCaseInput(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.type,
      required this.coordinates,
      required this.vehicleType,
      required this.vehicleLicenseImg,
      required this.deliveryApprovalImg,
      required this.role});
}
