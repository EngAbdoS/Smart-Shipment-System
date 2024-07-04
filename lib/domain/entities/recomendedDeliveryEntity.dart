import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecommendedDeliveryEntity {
  LatLng startLoc;
  LatLng endLoc;
  String startState;
  String endState;
  String time;
  String duration;
  String day;
  String id;
  String role;
  String currentGovState;
  String userName;
  String phoneNumber;
  String vehicleType;
  String profileImage;

  RecommendedDeliveryEntity({
    required this.id,
    required this.userName,
    required this.phoneNumber,
    required this.role,
    required this.vehicleType,
    required this.currentGovState,
    required this.profileImage,
    required this.startLoc,
    required this.endLoc,
    required this.startState,
    required this.endState,
    required this.time,
    required this.duration,
    required this.day,
  });
}

class DeliveryTripEntity {
  LatLng startLoc;
  LatLng endLoc;
  String startState;
  String endState;
  String time;
  String duration;
  String day;
  String id;

  DeliveryTripEntity(
      {required this.startLoc,
      required this.endLoc,
      required this.startState,
      required this.endState,
      required this.time,
      required this.duration,
      required this.day,
      required this.id});
}
