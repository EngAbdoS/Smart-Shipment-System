import 'package:smart_shipment_system/data/response/response.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';

extension UserResponseMapper on UserResponse? {
  UserModel toDomain() {
    return UserModel(
      userName: this?.userName ?? "noName",
      email: this?.email ?? "noEmail",
      phoneNumber: this?.phoneNumber ?? "noPhone",
      role: this?.role ?? "noRole",
      isEmailConfirmed: this?.isEmailConfirmed ?? false,
      isDeliveryApproved: this?.isDeliveryApproved ?? false,
      userId: this?.userId ?? "noId",
    );
  }
}
