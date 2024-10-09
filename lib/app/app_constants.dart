import 'package:flutter/material.dart';

class AppConstants
{
  ///*for production*
  //static const String baseUrl="https://smart-shipment-system.vercel.app/api/v1/";
  //after change url run "flutter pub run build_runner build --delete-conflicting-outputs"
  static const String baseUrl="http://10.0.2.2:5648/api/v1/";

  static const String chatBotBaseUrl="https://api.dify.ai/v1";

  static const String empty="";
  static const String nullValue="NULL";
  static const int zero=0;

  static const String token="SEND TOKEN HERE";

  static const int apiTimeOut=120000;
  static const int maxDis=1000000;

  static const String userRoleClient="client";
  static const String deliveryRoleExternal="fixed-delivery";
  static const String deliveryRoleInternal="unorganized-delivery";
  static const String userRoleAdmin="admin";
  static const String userRoleNoRole="no-role";

  static const String deliveryApprovalImageStorageRef="delivery_approval_image/";
  static const String vehicleLicenseImageStorageRef="vehicle_license_image/";
  static const String profilePhotosStorageRef="profile_photos/";

  static const String currentStateTypePoint="Point";

  static const String activeShipmentStatusUnPicked="un-picked";
  static const String activeShipmentStatusPickedUp="picked-up";
  static const String activeShipmentStatusComing="coming";
  static const String activeShipmentStatusDelivered="delivered";

  static const int transitionDurationMillySeconds=300;
  static const int confirmationPictureSizeByBytes=10240;

  static const Size appDesignSize=Size(348, 926);
}