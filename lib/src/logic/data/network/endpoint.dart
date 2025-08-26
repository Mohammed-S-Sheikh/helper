import 'package:dio/dio.dart' show Dio, Response;
import 'package:helper/src/logic/data/network/types.dart';

typedef EndpointCallback = Future<Response<dynamic>> Function(Dio dio);

enum EndpointMethod {
  callback,
  get,
  post,
  put,
  delete,
}

class Endpoint {
  final String uri;
  final EndpointMethod method;
  final Json? body;
  final Json? queryParameters;
  final EndpointCallback? callback;
  final String dataKey;
  final String metaKey;

  const Endpoint.callback(
    this.callback, {
    this.dataKey = 'data',
    this.metaKey = 'meta',
  })  : method = EndpointMethod.callback,
        uri = '',
        body = null,
        queryParameters = null;

  const Endpoint.get(
    this.uri, {
    this.queryParameters,
    this.dataKey = 'data',
    this.metaKey = 'meta',
  })  : method = EndpointMethod.get,
        body = null,
        callback = null;

  const Endpoint.post(
    this.uri, {
    this.body,
    this.dataKey = 'data',
    this.metaKey = 'meta',
  })  : method = EndpointMethod.post,
        queryParameters = null,
        callback = null;

  const Endpoint.put(
    this.uri, {
    this.body,
    this.dataKey = 'data',
    this.metaKey = 'meta',
  })  : method = EndpointMethod.put,
        queryParameters = null,
        callback = null;

  const Endpoint.delete(
    this.uri, {
    this.body,
    this.dataKey = 'data',
    this.metaKey = 'meta',
  })  : method = EndpointMethod.delete,
        queryParameters = null,
        callback = null;

  const Endpoint._(
    this.uri, {
    required this.method,
    this.body,
    this.queryParameters,
    this.callback,
    this.dataKey = 'data',
    this.metaKey = 'meta',
  });

  Endpoint copyWithPage(int page) => Endpoint.get(
        uri,
        queryParameters: {...?queryParameters, 'page': page},
      );

  Endpoint copyWith({
    String? uri,
    EndpointMethod? method,
    Json? body,
    Json? queryParameters,
    EndpointCallback? callback,
    String? dataKey,
    String? metaKey,
  }) =>
      Endpoint._(
        uri ?? this.uri,
        method: method ?? this.method,
        body: body ?? this.body,
        queryParameters: queryParameters ?? this.queryParameters,
        callback: callback ?? this.callback,
        dataKey: dataKey ?? this.dataKey,
        metaKey: metaKey ?? this.metaKey,
      );
}
