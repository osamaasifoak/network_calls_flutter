import 'package:dio/dio.dart';
import 'package:sample_network_calls/main.dart';
import 'package:sample_network_calls/services/networks/dio_client_network.dart';

class DioApiServices {
  Future<dynamic> getRequest(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await serviceLocatorInstance<DioClientNetwork>().dio.get(
            uri,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
      return response.data;
    } on DioError catch (err) {
      return _returnDioErrorResponse(err);
    }
  }

  Future<dynamic> postRequest(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response =
          await serviceLocatorInstance<DioClientNetwork>().dio.post(
                uri,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress,
              );
      return response.data;
    } on DioError catch (err) {
      return _returnDioErrorResponse(err);
    }
  }

  Future<dynamic> putRequest(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response =
          await serviceLocatorInstance<DioClientNetwork>().dio.put(
                uri,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress,
              );
      return response.data;
    } on DioError catch (err) {
      return _returnDioErrorResponse(err);
    }
  }

  Future<dynamic> deleteRequest(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response =
          await serviceLocatorInstance<DioClientNetwork>().dio.delete(
                uri,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
              );
      return response.data;
    } on DioError catch (err) {
      return _returnDioErrorResponse(err);
    }
  }

  dynamic _returnDioErrorResponse(DioError error) {
    if (error.type == DioErrorType.connectTimeout) {
      throw FetchDataException('Error connection timeout');
    }
    switch (error.response?.statusCode) {
      case 400:
        throw BadRequestException(
            "${error.response!.statusMessage ?? "Bad request"}");
      case 401:
        throw UnauthorisedException(
            "Unauthorised request: ${error.response!.statusCode}");
      case 403:
        throw UnauthorisedException(
            "Access forbidden: ${error.response!.statusCode}");
      case 404:
        throw FetchDataException(
            "Api not found: ${error.response!.statusCode}");
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server ');
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
