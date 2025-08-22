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

    return await switch (method) {
      'GET' => _get<DataT>(uri, params: queryParameters),
      'POST' => _post<DataT>(uri, data: body),
      'PUT' => _put<DataT>(uri, data: body),
      'DELETE' => _delete<DataT>(uri, data: body),
      String() => throw UnimplementedError(),
    };
  }

  static Future<Result<T>> _get<T>(String url, {Json? params}) async {
    return _request<T>(() => _dio.get(_getUrl(url), queryParameters: params));
  }

  static Future<Result<T>> _post<T>(String url, {dynamic data}) async {
    final requestData = data != null ? JSerializer.toJson(data) : null;
    return _request<T>(() => _dio.post(_getUrl(url), data: requestData));
  }

  static Future<Result<T>> _put<T>(String url, {dynamic data}) async {
    final requestData = data != null ? JSerializer.toJson(data) : null;
    return _request<T>(() => _dio.put(_getUrl(url), data: requestData));
  }

  static Future<Result<T>> _delete<T>(String url, {dynamic data}) async {
    return _request<T>(() => _dio.delete(_getUrl(url), data: data));
  }

  static String _getUrl(String url) => url.replaceAll(RegExp('//+'), '/');

  static Future<Result<T>> _request<T>(
    Future<Response<dynamic>> Function() requestFunction,
  ) async {
    try {
      final response = await requestFunction();
      final responseData = response.data as Json;
      final jsonData = responseData['data'];
      final data = JSerializer.fromJson<T>(jsonData);

      return Result.success(
        data,
        meta: responseData['meta'] as Json?,
      );
    } catch (e) {
      return Result.failure(Failure.fromException(e));
    }
  }
}
