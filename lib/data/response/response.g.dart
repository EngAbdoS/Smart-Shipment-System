// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..statusCode = (json['statusCode'] as num?)?.toInt()
  ..status = json['status'] as String?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['deliveryApproved'] as bool?,
      json['tripPeriod'] as List<dynamic>?,
      json['_id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['role'] as String?,
      json['confirmedEmail'] as bool?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'deliveryApproved': instance.isDeliveryApproved,
      'tripPeriod': instance.tripPeriod,
      '_id': instance.userId,
      'name': instance.userName,
      'email': instance.email,
      'phone': instance.phoneNumber,
      'role': instance.role,
      'confirmedEmail': instance.isEmailConfirmed,
    };

DataUserResponse _$DataUserResponseFromJson(Map<String, dynamic> json) =>
    DataUserResponse(
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataUserResponseToJson(DataUserResponse instance) =>
    <String, dynamic>{
      'user': instance.userData,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['token'] as String?,
      json['data'] == null
          ? null
          : DataUserResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = (json['statusCode'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'data': instance.data,
    };

RegistrationResponse _$RegistrationResponseFromJson(
        Map<String, dynamic> json) =>
    RegistrationResponse()
      ..statusCode = (json['statusCode'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RegistrationResponseToJson(
        RegistrationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
    };
