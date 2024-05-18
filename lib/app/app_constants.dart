import 'package:flutter/material.dart';

class AppConstants
{
  static const String baseUrl="https://smart-shipment-system.vercel.app/api/v1/";
  static const String empty="";
  static const String nullValue="NULL";
  static const String token="SEND TOKEN HERE";
  static const int zero=0;
  static const int apiTimeOut=120000;
  static const String userRoleDelivery="USER_ROLE_DELIVERY";
  static const String userRoleClient="client";
  static const String deliveryRoleExternal="fix-delivery";
  static const String deliveryRoleInternal="unorganized-delivery";
  static const String userRoleAdmin="admin";
  static const String userRoleNoRole="no-role";




  static const int transitionDurationMillySeconds=300;
  static const int confirmationPictureSizeByBytes=10240;

  static const Size appDesignSize=Size(348, 926);
}