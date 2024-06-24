import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class MeDataResponse extends BaseResponse {
  @JsonKey(name: "data")
  DataResponse? dataResponse;

  MeDataResponse(this.dataResponse);

  factory MeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MeDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MeDataResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  @JsonKey(name: "data")
  UserResponse? userResponse;

  DataResponse(this.userResponse);

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "deliveryApproved")
  bool? isDeliveryApproved;
  @JsonKey(name: "_id")
  String? userId;
  @JsonKey(name: "name")
  String? userName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phoneNumber;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "confirmedEmail")
  bool? isEmailConfirmed;
  @JsonKey(name: "profileImage")
  String? profileImage;

  UserResponse(this.isDeliveryApproved, this.userId, this.userName, this.email,
      this.phoneNumber, this.role, this.isEmailConfirmed, this.profileImage);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json); //why factory
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class SearchOrderResponse extends BaseResponse {
  @JsonKey(name: "data")
  SearchOrderDataResponse? data;

  SearchOrderResponse(this.data);

  factory SearchOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchOrderResponseToJson(this);
}

@JsonSerializable()
class SearchOrderDataResponse {
  @JsonKey(name: "order")
  OrderResponse? order;

  SearchOrderDataResponse(this.order);

  factory SearchOrderDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchOrderDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchOrderDataResponseToJson(this);
}

@JsonSerializable()
class OrdersResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? resultsNumber;
  @JsonKey(name: "data")
  OrdersDataResponse? data;

  OrdersResponse(this.resultsNumber, this.data);

  factory OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersResponseToJson(this);
}

@JsonSerializable()
class OrdersDataResponse {
  @JsonKey(name: "orders")
  List<OrderResponse>? orders;

  OrdersDataResponse(this.orders);

  factory OrdersDataResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDataResponseToJson(this);
}

@JsonSerializable()
class OrderResponse {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "date") //not found
  String? date;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "recipentName")
  String? recipentName;
  @JsonKey(name: "reciepentPhone")
  String? reciepentPhone;
  @JsonKey(name: "senderName")
  String? senderName;
  @JsonKey(name: "senderPhone")
  String? senderPhone;
  @JsonKey(name: "startLoc")
  LatLonResponse? startLoc;
  @JsonKey(name: "currentLoc")
  LatLonResponse? currentLoc;
  @JsonKey(name: "endLoc")
  LatLonResponse? endLoc;
  @JsonKey(name: "endLocation")
  String? endLocation;
  @JsonKey(name: "startLocation")
  String? startLocation;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "unPicked")
  bool? unPicked;
  @JsonKey(name: "pickedUp")
  bool? pickedUp;
  @JsonKey(name: "coming")
  bool? coming;
  @JsonKey(name: "delivered")
  bool? delivered;
  @JsonKey(name: "weight")
  String? weight;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "delivery")
  List<UserResponse>? delivery;
  @JsonKey(name: "client")
  UserResponse? client;

  OrderResponse(
    this.type,
    this.id,
    this.date,
    this.recipentName,
    this.reciepentPhone,
    this.senderName,
    this.senderPhone,
    this.startLoc,
    this.currentLoc,
    this.endLoc,
    this.endLocation,
    this.startLocation,
    this.status,
    this.unPicked,
    this.pickedUp,
    this.coming,
    this.delivered,
    this.weight,
    this.quantity,
    this.description,
    this.delivery,
    this.client,
  );

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class RecommendedDeliveriesResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? resultsNumber;
  @JsonKey(name: "data")
  RecommendedDeliveriesDataResponse? data;

  RecommendedDeliveriesResponse(this.resultsNumber, this.data);

  factory RecommendedDeliveriesResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendedDeliveriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedDeliveriesResponseToJson(this);
}

@JsonSerializable()
class RecommendedDeliveriesDataResponse {
  @JsonKey(name: "deliveries")
  List<RecommendedDeliveryResponse>? deliveries;

  RecommendedDeliveriesDataResponse(this.deliveries);

  factory RecommendedDeliveriesDataResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RecommendedDeliveriesDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RecommendedDeliveriesDataResponseToJson(this);
}

@JsonSerializable()
class RecommendedDeliveryResponse {
  @JsonKey(name: "_id")
  String? userId;
  @JsonKey(name: "name")
  String? userName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phoneNumber;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "vehicleType")
  String? vehicleType;
  @JsonKey(name: "vehicleLicenseImg")
  String? vehicleLicenseImg;
  @JsonKey(name: "deliveryApprovalImg")
  String? deliveryApprovalImg;
  @JsonKey(name: "deliveryApproved")
  bool? deliveryApproved;
  @JsonKey(name: "profileImage")
  String? profileImage;
  @JsonKey(name: "trip")
  List<DeliveryTripResponse>? trips;
  @JsonKey(name: "confirmedEmail")
  bool? confirmedEmail;
  @JsonKey(name: "otpResetExpires")
  String? otpResetExpires;

  RecommendedDeliveryResponse(
      this.userId,
      this.userName,
      this.email,
      this.phoneNumber,
      this.role,
      this.vehicleType,
      this.vehicleLicenseImg,
      this.deliveryApprovalImg,
      this.deliveryApproved,
      this.profileImage,
      this.trips,
      this.confirmedEmail,
      this.otpResetExpires);

  factory RecommendedDeliveryResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendedDeliveryResponseFromJson(json); //why factory
  Map<String, dynamic> toJson() => _$RecommendedDeliveryResponseToJson(this);
}

@JsonSerializable()
class DeliveryTripResponse {
  @JsonKey(name: "startLoc")
  LatLonResponse? startLoc;
  @JsonKey(name: "endLoc")
  LatLonResponse? endLoc;
  @JsonKey(name: "startState")
  String? startState;
  @JsonKey(name: "endState")
  String? endState;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "duration")
  String? duration;
  @JsonKey(name: "day")
  String? day;
  @JsonKey(name: "_id")
  String? id;

  DeliveryTripResponse(this.startLoc, this.endLoc, this.startState,
      this.endState, this.time, this.duration, this.day, this.id);

  factory DeliveryTripResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliveryTripResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryTripResponseToJson(this);
}

@JsonSerializable()
class LatLonResponse {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "coordinates")
  List<double>? coordinates;
  @JsonKey(name: "_id")
  String? id;

  LatLonResponse(this.type, this.coordinates, this.id);

  factory LatLonResponse.fromJson(Map<String, dynamic> json) =>
      _$LatLonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LatLonResponseToJson(this);
}

@JsonSerializable()
class DataUserResponse {
  @JsonKey(name: "user")
  UserResponse? userData;

  DataUserResponse(this.userData);

  factory DataUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DataUserResponseFromJson(json); //why factory
  Map<String, dynamic> toJson() => _$DataUserResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "token")
  String? token;

  // @JsonKey(name: 'data')
  // DataUserResponse? data;

  AuthenticationResponse(this.token);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class RegistrationResponse extends BaseResponse {
  RegistrationResponse();

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);
}

@JsonSerializable()
class EmailVerificationResponse extends BaseResponse {
  EmailVerificationResponse();

  factory EmailVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmailVerificationResponseToJson(this);
}

@JsonSerializable()
class ForgetPasswordResponse extends BaseResponse {
  ForgetPasswordResponse();

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}
