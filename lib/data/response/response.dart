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
class UserResponse {
  @JsonKey(name: "deliveryApproved")
  bool? isDeliveryApproved;
  @JsonKey(name: "tripPeriod")
  List? tripPeriod;
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

  UserResponse(
      this.isDeliveryApproved,
      this.tripPeriod,
      this.userId,
      this.userName,
      this.email,
      this.phoneNumber,
      this.role,
      this.isEmailConfirmed);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json); //why factory
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
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
  @JsonKey(name: 'data')
  DataUserResponse? data;

  AuthenticationResponse(this.token, this.data);

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

