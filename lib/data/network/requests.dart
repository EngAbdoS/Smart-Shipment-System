class LoginRequest {
  String email;
  String password;

  LoginRequest({required this.email, required this.password});
}

class ClientRegistrationRequest {
  String name;
  String email;
  String phone;
  String password;
  String confirmPassword;
  String role;

  ClientRegistrationRequest(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.confirmPassword,
      required this.role});
}

// class FixedDeliveryRegistrationRequest {
//   String name;
//   String email;
//   String phone;
//   String password;
//   String confirmPassword;
//   String role;
//
//   FixedDeliveryRegistrationRequest(
//       {required this.name,
//         required this.email,
//         required this.phone,
//         required this.password,
//         required this.confirmPassword,
//         required this.role});
// }

class UnorganizedDeliveryRegistrationRequest {
  String name;
  String email;
  String phone;
  String password;
  String confirmPassword;
  CurrentStateRequest currentState;
  String vehicleType;
  String vehicleLicenseImg;
  String deliveryApprovalImg;
  String role;

  UnorganizedDeliveryRegistrationRequest(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.confirmPassword,
      required this.currentState,
      required this.vehicleType,
      required this.vehicleLicenseImg,
      required this.deliveryApprovalImg,
      required this.role});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
      'currentState': currentState.toJson(),
      'vehicleType': vehicleType,
      'vehicleLicenseImg': vehicleLicenseImg,
      'deliveryApprovalImg': deliveryApprovalImg,
      'role': role,
    };
  }
}

class CurrentStateRequest {
  String type;
  List<double> coordinates;

  CurrentStateRequest({required this.type, required this.coordinates});

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}

class EmailVerificationRequest {
  String email;
  String code;

  EmailVerificationRequest({required this.email, required this.code});
}
