import 'dart:ffi' show Void;

import 'package:helper/src/logic/data/model/model.dart';
import 'package:helper/src/logic/data/network/endpoint.dart';
import 'package:helper/src/logic/data/network/interceptors/interceptors.dart';
import 'package:dio/dio.dart';
import 'package:helper/src/logic/data/network/types.dart';
import 'package:jserializer/jserializer.dart';

class Api {
  const Api._();

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

    _dio.interceptors.addAll([
      FeedbackInterceptor(),
      HeadersInterceptor(),
      if (on401 != null) UnautherizedInterceptor(on401),
    ]);
  }

  static Future<Result<DataT>> request<DataT>(Endpoint endpoint) async {
    final uri = endpoint.uri;
    final method = endpoint.method;
    late final body = endpoint.body;
    late final queryParameters = endpoint.queryParameters;
    late final callback = endpoint.callback!;
    final dataKey = endpoint.dataKey;
    final metaKey = endpoint.metaKey;

    return await switch (method) {
      EndpointMethod.get => _get<DataT>(
          uri,
          params: queryParameters,
          dataKey: dataKey,
          metaKey: metaKey,
        ),
      EndpointMethod.post => _post<DataT>(
          uri,
          data: body,
          dataKey: dataKey,
          metaKey: metaKey,
        ),
      EndpointMethod.put => _put<DataT>(
          uri,
          data: body,
          dataKey: dataKey,
          metaKey: metaKey,
        ),
      EndpointMethod.delete => _delete<DataT>(
          uri,
          data: body,
          dataKey: dataKey,
          metaKey: metaKey,
        ),
      EndpointMethod.callback => _request<DataT>(
          () => callback(_dio),
          dataKey: dataKey,
          metaKey: metaKey,
        ),
    };
  }

  static Future<Result<T>> _get<T>(
    String url, {
    Json? params,
    required String dataKey,
    required String metaKey,
  }) async {
    return _request<T>(
      () => _dio.get(_getUrl(url), queryParameters: params),
      dataKey: dataKey,
      metaKey: metaKey,
    );
  }

  static Future<Result<T>> _post<T>(
    String url, {
    dynamic data,
    required String dataKey,
    required String metaKey,
  }) async {
    final requestData = data != null ? JSerializer.toJson(data) : null;
    return _request<T>(
      () => _dio.post(_getUrl(url), data: requestData),
      dataKey: dataKey,
      metaKey: metaKey,
    );
  }

  static Future<Result<T>> _put<T>(
    String url, {
    dynamic data,
    required String dataKey,
    required String metaKey,
  }) async {
    final requestData = data != null ? JSerializer.toJson(data) : null;
    return _request<T>(
      () => _dio.put(_getUrl(url), data: requestData),
      dataKey: dataKey,
      metaKey: metaKey,
    );
  }

  static Future<Result<T>> _delete<T>(
    String url, {
    dynamic data,
    required String dataKey,
    required String metaKey,
  }) async {
    return _request<T>(
      () => _dio.delete(_getUrl(url), data: data),
      dataKey: dataKey,
      metaKey: metaKey,
    );
  }

  static String _getUrl(String url) => url.replaceAll(RegExp('//+'), '/');

  static Future<Result<T>> _request<T>(
    Future<Response<dynamic>> Function() callback, {
    required String dataKey,
    required String metaKey,
  }) async {
    try {
      final response = await callback();
      final responseData = response.data as Json;
      final jsonData = responseData[dataKey];

      late final T data;
      if (T is Non || T is Void) {
        data = const Non._() as T;
      } else {
        data = JSerializer.fromJson<T>(jsonData);
      }

      return Result.success(
        data,
        meta: responseData[metaKey] as Json?,
      );
    } catch (e) {
      return Result.failure(Failure.fromException(e));
    }
  }
}

class Non {
  const Non._();
}
