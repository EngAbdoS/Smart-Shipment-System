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

MeDataResponse _$MeDataResponseFromJson(Map<String, dynamic> json) =>
    MeDataResponse(
      json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = (json['statusCode'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MeDataResponseToJson(MeDataResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
      'data': instance.dataResponse,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      json['data'] == null
          ? null
          : UserResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'data': instance.userResponse,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['deliveryApproved'] as bool?,
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

EmailVerificationResponse _$EmailVerificationResponseFromJson(
        Map<String, dynamic> json) =>
    EmailVerificationResponse()
      ..statusCode = (json['statusCode'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$EmailVerificationResponseToJson(
        EmailVerificationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
    };

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponse()
      ..statusCode = (json['statusCode'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ForgetPasswordResponseToJson(
        ForgetPasswordResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
    };
