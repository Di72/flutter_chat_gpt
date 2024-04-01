import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/data/network/network_service.dart';
import 'package:flutter_chat_gpt/core/domain/models/either.dart';
import 'package:flutter_chat_gpt/shared/exceptions/http_exception.dart';
import 'package:flutter_chat_gpt/core/domain/models/response.dart' as response;
import 'package:flutter_chat_gpt/shared/mixins/exception_handler_mixin.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio; // Dio instance for making HTTP requests.

  DioNetworkService(this.dio) {
    // Exclude setup during tests to avoid errors.
    if (!kTestMode) {
      dio.options = dioBaseOptions; // Apply base options to Dio.
      // If in debug mode, add an interceptor for logging request and response body for debugging purposes.
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  // BaseOptions configuration for Dio.
  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  // Getter for the base URL, fetched from shared constants.
  @override
  String get baseUrl => BASE_URL;

  // Getter for default headers, including authorization and content type.
  @override
  Map<String, Object> get headers => {
        'Authorization': 'Bearer $API_KEY',
        "Content-Type": "application/json",
      };

  // Performs a POST request to the specified endpoint with optional data.
  // Uses handleException to wrap Dio's post method for error handling.
  @override
  Future<Either<AppException, response.Response>> post(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.post(endpoint, data: data),
      endpoint: endpoint,
    );
    return res;
  }

  // Performs a GET request to the specified endpoint with optional query parameters.
  // Uses handleException to wrap Dio's get method for error handling.
  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(endpoint, queryParameters: queryParameters),
      endpoint: endpoint,
    );
    return res;
  }
}
