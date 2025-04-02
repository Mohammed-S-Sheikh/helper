import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(map: true),
)
class ResponseFailure with _$ResponseFailure {
  const factory ResponseFailure.notFound(Object error) = _NotFound;
  const factory ResponseFailure.badRequest(Object error) = _BadRequest;
  const factory ResponseFailure.unauthorized(Object error) = _Unauthorized;
  const factory ResponseFailure.forbidden(Object error) = _Forbidden;
  const factory ResponseFailure.conflict(Object error) = _Conflict;
  const factory ResponseFailure.serverError(Object error) = _ServerError;
  const factory ResponseFailure.serviceUnavailable(Object error) =
      _ServiceUnavailable;
  const factory ResponseFailure.tooManyRequests(Object error) =
      _TooManyRequests;
  const factory ResponseFailure.unknown(Object error) = _Unknown;
  const factory ResponseFailure.connectionTimeout(Object error) =
      _ConnectionTimeout;
  const factory ResponseFailure.sendTimeout(Object error) = _SendTimeout;
  const factory ResponseFailure.receiveTimeout(Object error) = _ReceiveTimeout;
  const factory ResponseFailure.cancel(Object error) = _Cancel;
  const factory ResponseFailure.badCertificate(Object error) = _BadCertificate;
  const factory ResponseFailure.connectionError(Object error) =
      _ConnectionError;
  const factory ResponseFailure.unprocessableEntity(
      Object error, Map<String, dynamic> validation) = _UnprocessableEntity;

  const ResponseFailure._();

  String get message => 'Something went wrong';

  Object? get errorObject {
    return map(
      notFound: (value) => value.error,
      badRequest: (value) => value.error,
      unauthorized: (value) => value.error,
      forbidden: (value) => value.error,
      conflict: (value) => value.error,
      serverError: (value) => value.error,
      serviceUnavailable: (value) => value.error,
      tooManyRequests: (value) => value.error,
      unknown: (value) => value.error,
      connectionTimeout: (value) => value.error,
      sendTimeout: (value) => value.error,
      receiveTimeout: (value) => value.error,
      cancel: (value) => value.error,
      badCertificate: (value) => value.error,
      connectionError: (value) => value.error,
      unprocessableEntity: (value) => value.error,
    );
  }

  static ResponseFailure fromException(Object error) {
    ResponseFailure handleDioException(DioException error) {
      ResponseFailure resolveBadResponse(Response response) {
        return switch (response.statusCode) {
          400 => ResponseFailure.badRequest(error),
          401 => ResponseFailure.unauthorized(error),
          403 => ResponseFailure.forbidden(error),
          404 => ResponseFailure.notFound(error),
          409 => ResponseFailure.conflict(error),
          500 => ResponseFailure.serverError(error),
          503 => ResponseFailure.serviceUnavailable(error),
          429 => ResponseFailure.tooManyRequests(error),
          422 => ResponseFailure.unprocessableEntity(error, response.data),
          _ => ResponseFailure.unknown(error),
        };
      }

      return switch (error.type) {
        DioExceptionType.connectionTimeout =>
          ResponseFailure.connectionTimeout(error),
        DioExceptionType.sendTimeout => ResponseFailure.sendTimeout(error),
        DioExceptionType.receiveTimeout =>
          ResponseFailure.receiveTimeout(error),
        DioExceptionType.badResponse => resolveBadResponse(error.response!),
        DioExceptionType.cancel => ResponseFailure.cancel(error),
        DioExceptionType.unknown => ResponseFailure.unknown(error),
        DioExceptionType.badCertificate =>
          ResponseFailure.badCertificate(error),
        DioExceptionType.connectionError =>
          ResponseFailure.connectionError(error),
      };
    }

    return switch (error) {
      DioException _ => handleDioException(error),
      _ => ResponseFailure.unknown(error),
    };
  }
}
