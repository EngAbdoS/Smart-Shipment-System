import 'package:smart_shipment_system/data/response/response.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';

extension UserResponseMapper on UserResponse? {
  UserModel toDomain() {
    return UserModel(
        this?.isDeliveryApproved ?? false,
        this?.tripPeriod ?? [],
        this?.userId ?? "noId",
        this?.userName ?? "noName",
        this?.email ?? "noEmail",
        this?.phoneNumber ?? "noPhone",
        this?.role ?? "noRole",
        this?.isEmailConfirmed ?? false);
  }
}
