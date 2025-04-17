import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:helper/src/data/local/local.dart';
import 'package:helper/src/data/model/model.dart';
import 'package:helper/src/data/network/network.dart';

abstract final class AppApi {
  static final Dio _dio = Dio();

  static void initialize({
    required String baseUrl,
    void Function()? on401,
  }) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.followRedirects = true;
    _dio.options.validateStatus = (status) {
      return status != null && status >= 200 && status < 400;
    };

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = AppPrefs.token;
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        final language = AppPrefs.language;
        if (language != null) {
          options.headers['Accept-Language'] = language;
        }

        handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          on401?.call();
        }

        handler.next(error);
      },
    ));
  }

  /// GET

  static Future<T> get<T>(
    String url, {
    required FromJson<T> fromJson,
  }) async =>
      fromJson(await _AppApiX.fetch(url, method: 'GET'));

  static Future<ApiResponse<T>> getResponse<T>(
    String url, {
    required FromJson<T> fromJson,
  }) =>
      _AppApiX.responseFetch(url, method: 'GET', fromJson: fromJson);

  static Future<Either<ResponseFailure, T>> getEither<T>(
    String url, {
    required FromJson<T> fromJson,
  }) =>
      _AppApiX.eitherFetch<T>(url, method: 'GET', fromJson: fromJson);

  /// POST

  static Future<T> post<T>(
    String url, {
    Object? body,
    required FromJson<T> fromJson,
  }) async =>
      fromJson(await _AppApiX.fetch(url, body: body, method: 'POST'));

  static Future<ApiResponse<T>> postResponse<T>(
    String url, {
    Object? body,
    required FromJson<T> fromJson,
  }) =>
      _AppApiX.responseFetch(url,
          body: body, method: 'POST', fromJson: fromJson);

  static Future<Either<ResponseFailure, T>> postEither<T>(
    String url, {
    Object? body,
    required FromJson<T> fromJson,
  }) =>
      _AppApiX.eitherFetch<T>(url,
          body: body, method: 'POST', fromJson: fromJson);
}

extension _AppApiX on AppApi {
  static Future<Map<String, dynamic>> fetch(
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

  static Future<Either<ResponseFailure, T>> eitherFetch<T>(
    String url, {
    Object? body,
    required String method,
    required FromJson<T> fromJson,
  }) async {
    try {
      final data = await fetch(url, body: body, method: method);
      return right(fromJson(data));
    } catch (e) {
      final failure = ResponseFailure.fromException(e);
      return left(failure);
    }
  }

  static Future<ApiResponse<T>> responseFetch<T>(
    String url, {
    Object? body,
    required String method,
    required FromJson<T> fromJson,
  }) async {
    try {
      final data = await fetch(url, body: body, method: method);
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
