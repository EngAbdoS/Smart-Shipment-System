import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_shipment_system/.env.dart';
import 'package:smart_shipment_system/app/app_constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "Authorization";

class ChatBotDioFactory {

  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      //Bearer $token
      AUTHORIZATION: 'Bearer $chatBotToken',
    };
    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: AppConstants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: AppConstants.apiTimeOut),
    );

    if (!kReleaseMode) {
      //not release
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseBody: true));
    }
    return dio;
  }
}
