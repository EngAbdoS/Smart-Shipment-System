class DeliveryTripModel {
  LongLat? fromLocation;
  LongLat? toLocation;
  int? expectedDurationByMin;
  String? tripTime;
  String? tripDetails;
  bool? isOneTime;
  List<String>? tripWeekDays;
}

class LongLat {
  double? long;
  double? lat;
}
