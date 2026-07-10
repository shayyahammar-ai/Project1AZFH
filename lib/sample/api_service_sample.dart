import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum ControllerStatus {inital,loading,error , loaded}
enum ApiMethodSample {
  get,
  post,
  put,
  delete,
  patch,
}

extension ApiMethodSampleValue on ApiMethodSample {
  String get value {
    switch (this) {
      case ApiMethodSample.get:
        return "GET";
      case ApiMethodSample.post:
        return "POST";
      case ApiMethodSample.put:
        return "PUT";
      case ApiMethodSample.delete:
        return "DELETE";
      case ApiMethodSample.patch:
        return "PATCH";
    }
  }
}


class ApiServiceSample {
  static ApiServiceSample? _instance;
  late dio.Dio _dio;
  late dio.BaseOptions _options;

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
  );

  ApiServiceSample._() {
    _options = dio.BaseOptions(
      baseUrl: 'https://api-shayyah.abukm.com/api',
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      validateStatus: (status) => status != null && status <= 500,
    );
    _dio = dio.Dio(_options);

    _dio.interceptors.addAll([
      CurlLoggerDioInterceptor(printOnSuccess: true),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
        logPrint: (object) => _logger.i(object),
      ),
    ]);
  }

  static ApiServiceSample get instance {
    _instance ??= ApiServiceSample._();
    return _instance!;
  }

  /// Simple makeRequest method that returns Either<String?, dynamic>
  /// Left for errors (String?), Right for success data (dynamic)
  Future<Either<String?, dynamic>> makeRequest({
    required ApiMethodSample method,
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final requestOptions =
          headers != null ? dio.Options(headers: headers) : null;

      dio.Response response;

      switch (method) {
        case ApiMethodSample.get:
          response = await _dio.get(
            endPoint,
            queryParameters: queryParams,
            options: requestOptions,
          );
          break;
        case ApiMethodSample.post:
          response = await _dio.post(
            endPoint,
            data: body,
            queryParameters: queryParams,
            options: requestOptions,
          );
          break;
        case ApiMethodSample.put:
          response = await _dio.put(
            endPoint,
            data: body,
            queryParameters: queryParams,
            options: requestOptions,
          );
          break;
        case ApiMethodSample.patch:
          response = await _dio.patch(
            endPoint,
            data: body,
            queryParameters: queryParams,
            options: requestOptions,
          );
          break;
        case ApiMethodSample.delete:
          response = await _dio.delete(
            endPoint,
            data: body,
            queryParameters: queryParams,
            options: requestOptions,
          );
          break;
      }

      // Handle response
      final apiResponse = _handleResponse(response);
      if (apiResponse.status == ApiResponseStatusSample.failure) {
        return Left(apiResponse.message);
      }
      return Right(apiResponse.data);
    } on dio.DioException catch (e) {
      // Handle Dio errors
      if (e.response != null) {
        final apiResponse = _handleResponse(e.response!);
        return Left(apiResponse.message);
      } else {
        // Network or timeout errors
        final errorMessage = e.message ?? 'Network error occurred';
        return Left(errorMessage);
      }
    } catch (e) {
      // Handle other errors
      return Left(e.toString());
    }
  }

  ApiResponseSample _handleResponse(dio.Response response) {
    final statusCode = response.statusCode ?? 0;
    final responseData = response.data;
    final message = responseData is Map
        ? (responseData['message'] ?? 'Request failed')
        : 'Request failed';

    switch (statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        return ApiResponseSample.success(responseData);
      case 400:
        return ApiResponseSample.failure(message);
      case 401:
        return ApiResponseSample.failure(message);
      case 403:
        return ApiResponseSample.failure(message);
      case 404:
        return ApiResponseSample.failure('Resource not found');
      case 405:
        return ApiResponseSample.failure('Method not allowed');
      case 422:
        return ApiResponseSample.failure(message);
      case 500:
        return ApiResponseSample.failure('Server error occurred');
      default:
        return ApiResponseSample.failure(message);
    }
  }

}

class ApiResponseSample {
  final ApiResponseStatusSample status;
  final dynamic data;
  final String? message;

  ApiResponseSample.success(this.data)
      : status = ApiResponseStatusSample.success,
        message = null;

  ApiResponseSample.failure(this.message)
      : status = ApiResponseStatusSample.failure,
        data = null;
}

enum ApiResponseStatusSample {
  success,
  failure,
}
