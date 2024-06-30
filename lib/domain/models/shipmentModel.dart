import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';

class ShipmentModel {
  String id;
  String date;
  String type;
  String recipentName;
  String reciepentPhone;
  String senderName;
  String senderPhone;
  LatLng startLoc;
  LatLng currentLoc;
  LatLng endLoc;
  String endLocation;
  String startLocation;
  String weight;
  int quantity;
  String description;
  String status;
  bool unPicked;
  bool pickedUp;
  bool coming;
  bool delivered;
  List<UserModel> delivery;
  UserModel? client;
  String? clientId;
  String price;
  String paidStatus;

  ShipmentModel(
      {required this.id,
      required this.date,
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
      required this.status,
      required this.unPicked,
      required this.pickedUp,
      required this.coming,
      required this.delivered,
      required this.delivery,
      this.client,
    this.clientId,
    required this.price,
    required this.paidStatus
      });
}
