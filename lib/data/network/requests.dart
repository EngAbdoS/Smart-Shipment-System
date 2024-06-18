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

class FixedDeliveryRegistrationRequest {
  String name;
  String email;
  String phone;
  String password;
  String confirmPassword;
  String vehicleType;
  String vehicleLicenseImg;
  String deliveryApprovalImg;
  String role;
  List<DeliveryTripRequest> trip;

  FixedDeliveryRegistrationRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.vehicleType,
    required this.vehicleLicenseImg,
    required this.deliveryApprovalImg,
    required this.role,
    required this.trip,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
      'vehicleType': vehicleType,
      'vehicleLicenseImg': vehicleLicenseImg,
      'deliveryApprovalImg': deliveryApprovalImg,
      'trip': trip.map((trip) => trip.toJson()).toList(),
      'role': role,
    };
  }
}

class DeliveryTripRequest {
  CurrentStateRequest endLoc;
  CurrentStateRequest startLoc;
  String startState;
  String endState;
  String time;
  String duration;
  String day;

  DeliveryTripRequest({
    required this.endLoc,
    required this.startLoc,
    required this.startState,
    required this.endState,
    required this.time,
    required this.duration,
    required this.day,
  });

  Map<String, dynamic> toJson() {
    return {
      'endLoc': endLoc.toJson(),
      'startLoc': startLoc.toJson(),
      'startState': startState,
      'endState': endState,
      'time': time,
      'duration': duration,
      'day': day,
    };
  }
}

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

class ResetPasswordRequest {
  String otp;
  String password;
  String confirmPassword;

  ResetPasswordRequest(
      {required this.otp,
      required this.password,
      required this.confirmPassword});
}
