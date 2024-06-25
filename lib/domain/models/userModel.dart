import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/domain/models/deliveryTripModel.dart';

class UserModel {
  bool isDeliveryApproved;
  List? tripPeriod;
  String userId;
  String userName;
  String email;
  String phoneNumber;
  String role;
  bool isEmailConfirmed;
  String profileImage;
  String vehicleType;
  String vehicleLicenseImg;
  List<DeliveryTripEntity>? tripList;

  UserModel(
      {required this.isDeliveryApproved,
      this.tripPeriod,
      required this.userId,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.role,
      required this.isEmailConfirmed,
      required this.profileImage,
      required this.vehicleType,
      required this.vehicleLicenseImg,
      required this.tripList});
}
