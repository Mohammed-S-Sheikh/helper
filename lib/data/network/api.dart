import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:helper/data/model/api_response.dart';
import 'package:helper/data/model/failure.dart';

abstract final class AppApi {
  static final Dio _dio = Dio();

  static Future<void> initialize({
    required String baseUrl,
    String? authToken,
    String? appLanguage,
  }) async {
    _dio.options.baseUrl = baseUrl;
    _dio.options.followRedirects = true;
    _dio.options.validateStatus = (status) {
      return status != null && status >= 200 && status < 400;
    };

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (authToken != null) {
          options.headers['Authorization'] = 'Bearer $authToken';
        }

        if (appLanguage != null) {
          options.headers['Accept-Language'] = appLanguage;
        }

        handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          // You could trigger a logout or token refresh here
        }

        handler.next(error);
      },
    ));
  }

  /// GET
  static Future<T> get<T>(
    String url, {
    required T Function(Map<String, dynamic> json) fromJson,
  }) async =>
      fromJson(await _AppApiX._fetch(url, method: 'GET'));

  static Future<ApiResponse<T>> getResponse<T>(
    String url, {
    required T Function(Map<String, dynamic> json) fromJson,
  }) =>
      _AppApiX._responseFetch(url, method: 'GET', fromJson: fromJson);

  static Future<Either<ResponseFailure, T>> getEither<T>(
    String url, {
    required T Function(Map<String, dynamic> json) fromJson,
  }) =>
      _AppApiX._eitherFetch<T>(url, method: 'GET', fromJson: fromJson);

  /// POST
  static Future<T> post<T>(
    String url, {
    Object? body,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async =>
      fromJson(await _AppApiX._fetch(url, body: body, method: 'POST'));

  static Future<ApiResponse<T>> postResponse<T>(
    String url, {
    Object? body,
    required T Function(Map<String, dynamic> json) fromJson,
  }) =>
      _AppApiX._responseFetch(url,
          body: body, method: 'POST', fromJson: fromJson);

  static Future<Either<ResponseFailure, T>> postEither<T>(
    String url, {
    Object? body,
    required T Function(Map<String, dynamic> json) fromJson,
  }) =>
      _AppApiX._eitherFetch<T>(url,
          body: body, method: 'POST', fromJson: fromJson);
}

extension _AppApiX on AppApi {
  static Future<Map<String, dynamic>> _fetch(
    String url, {
    Object? body,
    required String method,
  }) async {
    final options = RequestOptions(
      path: url,
      data: body,
      method: method,
      responseType: ResponseType.json,
    );
    final response = await AppApi._dio.fetch<Map<String, dynamic>>(options);
    return response.data!;
  }

  static Future<Either<ResponseFailure, T>> _eitherFetch<T>(
    String url, {
    Object? body,
    required String method,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    try {
      final data = await _fetch(url, body: body, method: method);
      return right(fromJson(data));
    } catch (e) {
      final failure = ResponseFailure.fromException(e);
      return left(failure);
    }
  }

  static Future<ApiResponse<T>> _responseFetch<T>(
    String url, {
    Object? body,
    required String method,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    try {
      final data = await _fetch(url, body: body, method: method);
      return ApiResponse<T>(
        status: data['status'],
        message: data['message'],
        data: fromJson(data['data']),
        paginationMeta: data['meta'],
      );
    } catch (e) {
      return ApiResponse<T>(
        status: 'error',
        message: e.toString(),
        failure: ResponseFailure.fromException(e),
      );
    }
  }
}
