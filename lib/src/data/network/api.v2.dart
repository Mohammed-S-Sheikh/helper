import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:helper/src/data/local/local.dart';
import 'package:helper/src/data/model/model.dart';
import 'package:helper/src/data/network/network.dart';

final class ApiEntry<T> {
  final String path;
  final String? method;
  final Object? body;
  final FromJson<T>? fromJson;

  const ApiEntry(
    this.path, {
    this.method,
    this.body,
    this.fromJson,
  });

  const ApiEntry.get(
    this.path, {
    this.fromJson,
  })  : method = 'GET',
        body = null;

  const ApiEntry.post(
    this.path, {
    this.body,
    this.fromJson,
  }) : method = 'POST';

  ApiEntry<T> copyWith({
    String? path,
    String? method,
    Object? body,
    FromJson<T>? fromJson,
  }) {
    return ApiEntry<T>(
      path ?? this.path,
      method: method ?? this.method,
      body: body ?? this.body,
      fromJson: fromJson ?? this.fromJson,
    );
  }
}

final class ApiRequest {
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

  static Future<T> fetch<T>(ApiEntry<T> entry) async {
    final response = await ApiRequest._dio.fetch<Json>(entry.options);
    return entry.fromJson == null
        ? response.data as T
        : entry.fromJson!(response.data!);
  }

  static EitherResponse<T> fetchEither<T>(ApiEntry<T> entry) async {
    try {
      final response = await fetch<T>(entry);
      return right(response);
    } catch (e) {
      final failure = ResponseFailure.fromException(e);
      return left(failure);
    }
  }

  static Future<ApiResponse<T>> fetchResponse<T>(
    ApiEntry<dynamic> entry,
  ) async {
    if (entry.fromJson == null) {
      entry = entry.copyWith(
        fromJson: (json) => ApiResponse<T>.fromJson(
          json,
          (data) => data as T,
        ),
      );
    } else if (entry.fromJson != ApiResponse<T>.fromJson) {
      entry = entry.copyWith(
        fromJson: (json) => ApiResponse<T>.fromJson(
          json,
          (data) => entry.fromJson!(data as Json) as T,
        ),
      );
    }

    return fetch<ApiResponse<T>>(entry as ApiEntry<ApiResponse<T>>);
  }
}

extension ApiEntryX<DataT> on ApiEntry<ApiResponse<DataT>> {
  ApiEntry<ApiResponse<DataT>> withPageKey(int page) {
    final newPath = '$path?page=$page';
    return copyWith(path: newPath);
  }
}

extension<T> on ApiEntry {
  RequestOptions get options {
    return RequestOptions(
      path: path,
      data: body,
      method: method,
      responseType: ResponseType.json,
    );
  }
}
