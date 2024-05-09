import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryTripModel {
  LatLng? fromLocation;
  LatLng? toLocation;
  String? fromAddressName;
  String? toAddressName;
  String? fromGovernment;
  String? toGovernment;
  int? expectedDurationByMin;
  String? tripTime;
  String? tripDetails;
  bool? isOneTime;
  String? tripDay;
  List<String>? tripWeekDays;

  DeliveryTripModel(
      {required this.fromLocation,
      required this.toGovernment,
        required this.fromAddressName,
        required this.toAddressName,
      required this.toLocation,
      required this.fromGovernment,
      required this.expectedDurationByMin,
      required this.isOneTime,
      required this.tripDetails,
      required this.tripTime,
        required this.tripDay,
      required this.tripWeekDays});
}
