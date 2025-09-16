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
    Json Function()? extraHeaders,
    void Function()? on401,
  }) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.followRedirects = true;
    _dio.options.validateStatus = (status) {
      return status != null && status >= 200 && status < 400;
    };

    _dio.interceptors.addAll([
      FeedbackInterceptor(),
      HeadersInterceptor(extraHeaders),
      if (on401 != null) UnautherizedInterceptor(on401),
    ]);
  }

  static Future<Result<DataT>> request<DataT>(
    Endpoint endpoint, {
    Json? body,
    Json? queryParameters,
    List<MultipartFile>? multipartFiles,
  }) async {
    try {
      final dataKey = endpoint.dataKey ?? 'data';
      final metaKey = endpoint.metaKey ?? 'meta';

      final Options options = Options(
        method: endpoint.method.name.toUpperCase(),
      );

      dynamic data = body != null ? JSerializer.toJson(body) : null;

      if (multipartFiles != null) {
        final filesKey = endpoint.filesKey ?? 'files';
        data = FormData.fromMap({
          filesKey: multipartFiles,
          ...?data,
        });
        options.contentType = 'multipart/form-data';
      }

      final url = endpoint.uri.replaceAll(RegExp('//+'), '/');
      final response = await _dio.request(
        url,
        data: data,
        queryParameters: {...?queryParameters, ...?endpoint.queryParameters},
        options: options,
      );
      final responseData = response.data as Json;
      final jsonData = responseData[dataKey];

      late final DataT resultData;
      if (DataT == Non || DataT == Void) {
        resultData = const Non._() as DataT;
      } else {
        resultData = JSerializer.fromJson<DataT>(jsonData);
      }

      return Result.success(
        resultData,
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
