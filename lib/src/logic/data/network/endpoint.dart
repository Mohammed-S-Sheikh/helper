import 'package:helper/src/logic/data/network/types.dart';

class Endpoint {
  final String uri;
  final String method;
  final Json? body;
  final Json? queryParameters;

  const Endpoint.get(
    this.uri, {
    this.queryParameters,
  })  : method = 'GET',
        body = null;

  const Endpoint.post(
    this.uri, {
    this.body,
  })  : method = 'POST',
        queryParameters = null;

  const Endpoint.delete(
    this.uri, {
    this.body,
  })  : method = 'DELETE',
        queryParameters = null;

  const Endpoint._(
    this.uri, {
    required this.method,
    this.body,
    this.queryParameters,
  });

  Endpoint copyWithPage(int page) => Endpoint.get(
        uri,
        queryParameters: {...?queryParameters, 'page': page},
      );

  Endpoint copyWith({
    String? uri,
    String? method,
    Json? body,
    Json? queryParameters,
  }) =>
      Endpoint._(
        uri ?? this.uri,
        method: method ?? this.method,
        body: body ?? this.body,
        queryParameters: queryParameters ?? this.queryParameters,
      );
}
