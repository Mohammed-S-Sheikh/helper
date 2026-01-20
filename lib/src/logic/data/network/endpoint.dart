import 'package:helper/src/logic/data/network/types.dart';

enum EndpointMethod { get, post, put, patch, delete }

class Endpoint {
  final String uri;
  final EndpointMethod method;
  final Json? queryParameters;
  final bool wrapped;
  final String? dataKey;
  final String? filesKey;
  final String? metaKey;

  const Endpoint.get(
    this.uri, {
    this.queryParameters,
    this.wrapped = true,
    this.dataKey,
    this.metaKey,
  })  : method = EndpointMethod.get,
        filesKey = null;

  const Endpoint.post(
    this.uri, {
    this.wrapped = true,
    this.dataKey,
    this.filesKey,
  })  : method = EndpointMethod.post,
        metaKey = null,
        queryParameters = null;

  const Endpoint.put(
    this.uri, {
    this.wrapped = true,
    this.dataKey,
    this.filesKey,
  })  : method = EndpointMethod.put,
        metaKey = null,
        queryParameters = null;

  const Endpoint.patch(
    this.uri, {
    this.wrapped = true,
    this.dataKey,
    this.filesKey,
  })  : method = EndpointMethod.patch,
        metaKey = null,
        queryParameters = null;

  const Endpoint.delete(
    this.uri, {
    this.wrapped = true,
    this.dataKey,
  })  : method = EndpointMethod.delete,
        metaKey = null,
        queryParameters = null,
        filesKey = null;

  Endpoint copyWithPage(int page) => Endpoint.get(
        uri,
        queryParameters: {...?queryParameters, 'page': page},
      );
}
