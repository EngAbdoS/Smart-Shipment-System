import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShipmentEntity {
  String date;
  String type;
  String recipentName;
  String reciepentPhone;
  String senderName;
  String senderPhone;
  LatLng startLoc;
  LatLng endLoc;
  String endLocation;
  String startLocation;
  String weight;
  int quantity;
  String description;

  ShipmentEntity({
    required this.date,
    required this.type,
    required this.recipentName,
    required this.reciepentPhone,
    required this.senderName,
    required this.senderPhone,
    required this.startLoc,
    required this.endLoc,
    required this.endLocation,
    required this.startLocation,
    required this.weight,
    required this.quantity,
    required this.description,
  });
}
