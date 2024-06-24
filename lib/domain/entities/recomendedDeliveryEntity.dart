import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecommendedDeliveryEntity {
  String userId;
  String userName;
  String email;
  String phoneNumber;
  String role;
  String vehicleType;
  String vehicleLicenseImg;
  String deliveryApprovalImg;
  String profileImage;
  bool deliveryApproved;
  List<RecommendedDeliveryTripEntity> trips;
  String otpResetExpires;
  bool confirmedEmail;

  RecommendedDeliveryEntity(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.role,
      required this.vehicleType,
      required this.vehicleLicenseImg,
      required this.deliveryApprovalImg,
      required this.profileImage,
      required this.deliveryApproved,
      required this.trips,
      required this.otpResetExpires,
      required this.confirmedEmail});
}

class RecommendedDeliveryTripEntity {
  LatLng startLoc;
  LatLng endLoc;
  String startState;
  String endState;
  String time;
  String duration;
  String day;
  String id;

  RecommendedDeliveryTripEntity(
      {required this.startLoc,
      required this.endLoc,
      required this.startState,
      required this.endState,
      required this.time,
      required this.duration,
      required this.day,
      required this.id});
}
