import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/data/response/response.dart';
import 'package:smart_shipment_system/domain/entities/deliveryOrderIntity.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
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
      profileImage: this?.profileImage ?? "noImage",
      vehicleType: this?.vehicleType ?? "noType",
      vehicleLicenseImg: this?.vehicleLicenseImg ?? "noImage",
      tripList: this?.trips?.map((trip) => trip.toDomain()).toList() ?? [],
    );
  }
}

extension OrdersResponseMapper on OrderResponse? {
  ShipmentModel toDomain() {
    return ShipmentModel(
      id: this?.id ?? "noId",
      date: this?.date ?? "noDate",
      type: this?.type ?? "noType",
      recipentName: this?.recipentName ?? "",
      reciepentPhone: this?.reciepentPhone ?? "",
      senderName: this?.senderName ?? "",
      senderPhone: this?.senderPhone ?? "",
      startLoc: LatLng(this?.startLoc?.coordinates?[0] ?? 0,
          this?.startLoc?.coordinates?[1] ?? 0),
      currentLoc: LatLng(this?.startLoc?.coordinates?[0] ?? 0,
          this?.startLoc?.coordinates?[1] ?? 0),
      endLoc: LatLng(this?.startLoc?.coordinates?[0] ?? 0,
          this?.startLoc?.coordinates?[1] ?? 0),
      endLocation: this?.endLocation ?? "",
      startLocation: this?.startLocation ?? "",
      weight: this?.weight ?? "",
      quantity: this?.quantity ?? 0,
      description: this?.description ?? "",
      status: this?.status ?? "noStatus",
      unPicked: this?.unPicked ?? false,
      pickedUp: this?.pickedUp ?? false,
      delivered: this?.delivered ?? false,
      coming: this?.coming ?? false,
      paidStatus: this?.paidStatus ?? '',
      price: this?.price.toString() ?? '',
      delivery:
          this?.delivery?.map((delivery) => delivery.toDomain()).toList() ?? [],
      client: this?.client?.toDomain() ??
          UserModel(
              isDeliveryApproved: false,
              isEmailConfirmed: false,
              role: "noRole",
              userName: "noName",
              email: "noEmail",
              phoneNumber: "noPhone",
              userId: "noId",
              profileImage: "noImage",
              vehicleType: '',
              vehicleLicenseImg: '',
              tripList: []),
    );
  }
}

extension OrderClientIdResponseMapper on OrderClientIdResponse? {
  ShipmentModel toDomain() {
    return ShipmentModel(
      id: this?.id ?? "noId",
      date: this?.date ?? "noDate",
      type: this?.type ?? "noType",
      recipentName: this?.recipentName ?? "",
      reciepentPhone: this?.reciepentPhone ?? "",
      senderName: this?.senderName ?? "",
      senderPhone: this?.senderPhone ?? "",
      startLoc: LatLng(this?.startLoc?.coordinates?[0] ?? 0,
          this?.startLoc?.coordinates?[1] ?? 0),
      currentLoc: LatLng(this?.startLoc?.coordinates?[0] ?? 0,
          this?.startLoc?.coordinates?[1] ?? 0),
      endLoc: LatLng(this?.startLoc?.coordinates?[0] ?? 0,
          this?.startLoc?.coordinates?[1] ?? 0),
      endLocation: this?.endLocation ?? "",
      startLocation: this?.startLocation ?? "",
      weight: this?.weight ?? "",
      quantity: this?.quantity ?? 0,
      description: this?.description ?? "",
      status: this?.status ?? "noStatus",
      unPicked: this?.unPicked ?? false,
      pickedUp: this?.pickedUp ?? false,
      delivered: this?.delivered ?? false,
      coming: this?.coming ?? false,
      paidStatus: this?.paidStatus ?? '',
      price: this?.price.toString() ?? '',
      delivery:
          this?.delivery?.map((delivery) => delivery.toDomain()).toList() ?? [],
      clientId: this?.client ?? "",
    );
  }
}

extension RecommmendedDeliveryeMapper on RecommendedDeliveryResponse? {
  RecommendedDeliveryEntity toDomain() {
    return RecommendedDeliveryEntity(
      userName: this?.deliveryPerson?.userName ?? "noName",
      phoneNumber: this?.deliveryPerson?.phoneNumber ?? "noPhone",
      vehicleType: this?.deliveryPerson?.vehicleType ?? "noType",
      profileImage: this?.deliveryPerson?.profileImage ?? "noImage",
      startLoc: LatLng(this?.startLoc?.coordinates?[0] ?? 0,
          this?.startLoc?.coordinates?[1] ?? 0),
      endLoc: LatLng(this?.endLoc?.coordinates?[0] ?? 0,
          this?.endLoc?.coordinates?[1] ?? 0),
      startState: this?.startState ?? "noState",
      endState: this?.endState ?? "noState",
      time: this?.time ?? "noTime",
      duration: this?.duration ?? "noDuration",
      day: this?.day ?? "noDay",
      id: this?.deliveryPerson?.userId ?? "noId",      role: AppConstants.deliveryRoleExternal,
      currentGovState: '',
    );
  }
}

extension RecommmendedDeliveryTripMapper on DeliveryTripResponse? {
  DeliveryTripEntity toDomain() {
    return DeliveryTripEntity(
      startLoc: LatLng(this?.startLoc?.coordinates?[0] ?? 0,
          this?.startLoc?.coordinates?[1] ?? 0),
      endLoc: LatLng(this?.endLoc?.coordinates?[0] ?? 0,
          this?.endLoc?.coordinates?[1] ?? 0),
      startState: this?.startState ?? "noState",
      endState: this?.endState ?? "noState",
      time: this?.time ?? "noTime",
      duration: this?.duration ?? "noDuration",
      day: this?.day ?? "noDay",
      id: this?.id ?? "noId",
    );
  }
}

extension DeliveryOrdersResponseMapper on DeliveryOrderResponse? {
  DeliveryOrderEntity toDomain() {
    return DeliveryOrderEntity(
      type: this?.type ?? "noType",
      weight: this?.weight ?? "",
      quantity: this?.quantity ?? 0,
      description: this?.description ?? "",
      status: this?.status ?? "noStatus",
      client: this?.client ?? "noClient",
      orderId: this?.orderId ?? "noOrderId",
    );
  }
}

extension NearestRecommendedDeliveryMapper
    on NearestRecommendedDeliveryResponse? {
  RecommendedDeliveryEntity toDomain() {
    return RecommendedDeliveryEntity(
      userName: this?.userName ?? "noName",
      phoneNumber: this?.phoneNumber ?? "noPhone",
      vehicleType: this?.vehicleType ?? "noType",
      profileImage: this?.profileImage ?? "noImage",
      startLoc: LatLng(this?.startLoc?.coordinates?[0] ?? 0,
          this?.startLoc?.coordinates?[1] ?? 0),
      endLoc: LatLng(this?.endLoc?.coordinates?[0] ?? 0,
          this?.endLoc?.coordinates?[1] ?? 0),
      startState: this?.startState ?? "noState",
      endState: this?.endState ?? "noState",
      time: this?.time ?? "noTime",
      duration: this?.duration ?? "noDuration",
      day: this?.day ?? "noDay",
      id: this?.deliveryId ?? "noId",
      role: this?.role ?? "noRole",
      currentGovState: '',
    );
  }
}
