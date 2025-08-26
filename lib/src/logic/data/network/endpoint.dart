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

  const Endpoint.callback(this.callback)
      : method = EndpointMethod.callback,
        uri = '',
        body = null,
        queryParameters = null;

  const Endpoint.get(
    this.uri, {
    this.queryParameters,
  })  : method = EndpointMethod.get,
        body = null,
        callback = null;

  const Endpoint.post(
    this.uri, {
    this.body,
  })  : method = EndpointMethod.post,
        queryParameters = null,
        callback = null;

  const Endpoint.put(
    this.uri, {
    this.body,
  })  : method = EndpointMethod.put,
        queryParameters = null,
        callback = null;

  const Endpoint.delete(
    this.uri, {
    this.body,
  })  : method = EndpointMethod.delete,
        queryParameters = null,
        callback = null;

  const Endpoint._(
    this.uri, {
    required this.method,
    this.body,
    this.queryParameters,
    this.callback,
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
  }) =>
      Endpoint._(
        uri ?? this.uri,
        method: method ?? this.method,
        body: body ?? this.body,
        queryParameters: queryParameters ?? this.queryParameters,
        callback: callback ?? this.callback,
      );
}
