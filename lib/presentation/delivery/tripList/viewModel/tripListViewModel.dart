import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/domain/models/deliveryTripModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';

class TripListViewModel{
  TripListViewModel(this._repository, this.tripList);
  final Repository _repository;

  final List<DeliveryTripEntity> tripList;




}