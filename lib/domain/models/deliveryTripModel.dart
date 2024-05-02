import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryTripModel {
  LatLng? fromLocation;
  LatLng? toLocation;
  String? fromGovernment;
  String? toGovernment;
  int? expectedDurationByMin;
  String? tripTime;
  String? tripDetails;
  bool? isOneTime;
  List<String>? tripWeekDays;
}
