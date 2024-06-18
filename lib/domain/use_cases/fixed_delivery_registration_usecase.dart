import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/base_use_case.dart';

class FixedDeliveryRegistrationUseCase
    implements BaseUseCase<FixedDeliveryRegistrationUseCaseInput, bool> {
  final Repository _repository;

  FixedDeliveryRegistrationUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(
      FixedDeliveryRegistrationUseCaseInput input) async {
    return await _repository.fixedDeliveryRegistration(
      FixedDeliveryRegistrationRequest(
          name: input.name,
          email: input.email,
          phone: input.phone,
          password: input.password,
          confirmPassword: input.confirmPassword,
          trip: input.trip,
          vehicleType: "",
          vehicleLicenseImg: "",
          deliveryApprovalImg: input.deliveryApprovalImg,
          role: input.role),
    );
  }
}

class FixedDeliveryRegistrationUseCaseInput {
  String name;
  String phone;
  String email;
  String password;
  String confirmPassword;
List<DeliveryTripRequest>trip;

  String deliveryApprovalImg;
  String role;

  FixedDeliveryRegistrationUseCaseInput(
      {required this.name,
        required this.phone,
        required this.email,
        required this.password,
        required this.confirmPassword,
        required this.trip,
        required this.deliveryApprovalImg,
        required this.role});
}
