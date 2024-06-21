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

SearchOrderResponse _$SearchOrderResponseFromJson(Map<String, dynamic> json) =>
    SearchOrderResponse(
      json['data'] == null
          ? null
          : SearchOrderDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..statusCode = (json['statusCode'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SearchOrderResponseToJson(
        SearchOrderResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

SearchOrderDataResponse _$SearchOrderDataResponseFromJson(
        Map<String, dynamic> json) =>
    SearchOrderDataResponse(
      json['order'] == null
          ? null
          : OrderResponse.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchOrderDataResponseToJson(
        SearchOrderDataResponse instance) =>
    <String, dynamic>{
      'order': instance.order,
    };

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      (json['results'] as num?)?.toInt(),
      json['data'] == null
          ? null
          : OrdersDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = (json['statusCode'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OrdersResponseToJson(OrdersResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
      'results': instance.resultsNumber,
      'data': instance.data,
    };

OrdersDataResponse _$OrdersDataResponseFromJson(Map<String, dynamic> json) =>
    OrdersDataResponse(
      (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersDataResponseToJson(OrdersDataResponse instance) =>
    <String, dynamic>{
      'orders': instance.orders,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      json['type'] as String?,
      json['_id'] as String?,
      json['date'] as String?,
      json['recipentName'] as String?,
      json['reciepentPhone'] as String?,
      json['senderName'] as String?,
      json['senderPhone'] as String?,
      json['startLoc'] == null
          ? null
          : LatLonResponse.fromJson(json['startLoc'] as Map<String, dynamic>),
      json['currentLoc'] == null
          ? null
          : LatLonResponse.fromJson(json['currentLoc'] as Map<String, dynamic>),
      json['endLoc'] == null
          ? null
          : LatLonResponse.fromJson(json['endLoc'] as Map<String, dynamic>),
      json['endLocation'] as String?,
      json['startLocation'] as String?,
      json['status'] as String?,
      json['unPicked'] as bool?,
      json['pickedUp'] as bool?,
      json['coming'] as bool?,
      json['delivered'] as bool?,
      json['weight'] as String?,
      (json['quantity'] as num?)?.toInt(),
      json['description'] as String?,
      (json['delivery'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['client'] == null
          ? null
          : UserResponse.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'date': instance.date,
      'type': instance.type,
      'recipentName': instance.recipentName,
      'reciepentPhone': instance.reciepentPhone,
      'senderName': instance.senderName,
      'senderPhone': instance.senderPhone,
      'startLoc': instance.startLoc,
      'currentLoc': instance.currentLoc,
      'endLoc': instance.endLoc,
      'endLocation': instance.endLocation,
      'startLocation': instance.startLocation,
      'status': instance.status,
      'unPicked': instance.unPicked,
      'pickedUp': instance.pickedUp,
      'coming': instance.coming,
      'delivered': instance.delivered,
      'weight': instance.weight,
      'quantity': instance.quantity,
      'description': instance.description,
      'delivery': instance.delivery,
      'client': instance.client,
    };

LatLonResponse _$LatLonResponseFromJson(Map<String, dynamic> json) =>
    LatLonResponse(
      json['type'] as String?,
      (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$LatLonResponseToJson(LatLonResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
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
