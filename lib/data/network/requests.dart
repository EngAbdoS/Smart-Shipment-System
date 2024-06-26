import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateShipmentRequest {
  String type;
  String recipentName;
  String reciepentPhone;
  String senderName;
  String senderPhone;
  CurrentStateRequest startLoc;
  CurrentStateRequest currentLoc;
  CurrentStateRequest endLoc;
  String endLocation;
  String startLocation;
  String weight;
  int quantity;
  String description;

  CreateShipmentRequest({
    required this.type,
    required this.recipentName,
    required this.reciepentPhone,
    required this.senderName,
    required this.senderPhone,
    required this.startLoc,
    required this.currentLoc,
    required this.endLoc,
    required this.endLocation,
    required this.startLocation,
    required this.weight,
    required this.quantity,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'recipentName': recipentName,
      'reciepentPhone': reciepentPhone,
      'senderName': senderName,
      'senderPhone': senderPhone,
      'startLoc': startLoc.toJson(),
      'currentLoc': currentLoc.toJson(),
      'endLoc': endLoc.toJson(),
      'endLocation': endLocation,
      'startLocation': startLocation,
      'weight': weight,
      'quantity': quantity,
      'description': description,
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

class GetDeliveriesRequest {
  double startLocationLat;
  double startLocationLng;
  String endLocation;
  int maxDis;

  GetDeliveriesRequest(
      {required this.startLocationLat,
      required this.startLocationLng,
      required this.endLocation,
      required this.maxDis});
}

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

class UpdateDeliveryTripListRequest {
  List<DeliveryTripRequest> trip;

  UpdateDeliveryTripListRequest({required this.trip});

  Map<String, dynamic> toJson() {
    return {
      'trip': trip.map((trip) => trip.toJson()).toList(),
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
