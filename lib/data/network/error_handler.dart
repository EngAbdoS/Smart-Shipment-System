import 'package:dio/dio.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handelError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handelError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    case DioErrorType.receiveTimeout:
      return DataSource.RECIVED_TIMEOUT.getFailure();

    case DioErrorType.badCertificate:
    // TODO: Handle this case.

    case DioErrorType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return _handlePadResponse(
            error.response?.statusCode ?? 0, error.response);
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();

    case DioErrorType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();

    case DioErrorType.unknown:
      return DataSource.DEFAULT.getFailure();
  }
}

Failure _handlePadResponse(int statusCode, dynamic response) {
  if (statusCode == 404) {
    return DataSource.NOT_FOUND.getFailure();
  } else if (statusCode == 500) {
    return DataSource.INTERNAL_SERVER_ERROR.getFailure();
  } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
    return DataSource.UNAUTHORISED.getFailure();
  } else {
    return DataSource.DEFAULT.getFailure();
  }
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseMessage.SUCCESS, ResponseCode.SUCCESS);
        break;
      case DataSource.NO_CONTANT:
        return Failure(ResponseMessage.NO_CONTANT, ResponseCode.CREATED);
        break;

      case DataSource.BAD_REQUEST:
        return Failure(ResponseMessage.BAD_REQUEST, ResponseCode.BAD_REQUEST);
        break;

      case DataSource.FORBIDDEN:
        return Failure(ResponseMessage.FORBIDDEN, ResponseCode.FORBIDDEN);
        break;

      case DataSource.UNAUTHORISED:
        return Failure(ResponseMessage.UNAUTHORISED, ResponseCode.UNAUTHORISED);
        break;

      case DataSource.NOT_FOUND:
        return Failure(ResponseMessage.NOT_FOUND, ResponseCode.NOT_FOUND);
        break;

      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseMessage.INTERNAL_SERVER_ERROR,
            ResponseCode.INTERNAL_SERVER_ERROR);
        break;

      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseMessage.CONNECT_TIMEOUT, ResponseCode.CONNECT_TIMEOUT);
        break;

      case DataSource.CANCEL:
        return Failure(ResponseMessage.CANCEL, ResponseCode.CANCEL);
        break;

      case DataSource.RECIVED_TIMEOUT:
        return Failure(
            ResponseMessage.RECIVED_TIMEOUT, ResponseCode.RECIVED_TIMEOUT);
        break;

      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseMessage.SEND_TIMEOUT, ResponseCode.SEND_TIMEOUT);
        break;

      case DataSource.CACHE_ERROR:
        return Failure(ResponseMessage.CACHE_ERROR, ResponseCode.CACHE_ERROR);
        break;

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseMessage.NO_INTERNET_CONNECTION,
            ResponseCode.NO_INTERNET_CONNECTION);
        break;

      case DataSource.DEFAULT:
        return Failure(ResponseMessage.DEFAULT, ResponseCode.DEFAULT);
        break;
    }
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTANT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIVED_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int CREATED = 201;
  static const int NO_CONTANT = 204;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORISED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  //local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIVED_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.success;
  static const String NO_CONTANT = AppStrings.noContent;
  static const String BAD_REQUEST = AppStrings.badRequestError;
  static const String UNAUTHORISED = AppStrings.unauthorizedError;
  static const String FORBIDDEN = AppStrings.forbiddenError;
  static const String NOT_FOUND = AppStrings.notFoundError;
  static const String INTERNAL_SERVER_ERROR = AppStrings.internalServerError;

//      "Oops some thing went wrong , try again later";

  //local status code
  static const String CONNECT_TIMEOUT = AppStrings.timeoutError;
  static const String CANCEL = AppStrings.conflictError;
  static const String RECIVED_TIMEOUT = AppStrings.timeoutError;
  static const String SEND_TIMEOUT = AppStrings.timeoutError;
  static const String CACHE_ERROR = AppStrings.cacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const String DEFAULT = AppStrings.defaultError;
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
