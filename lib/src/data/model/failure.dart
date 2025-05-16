import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(map: true),
)
class Failure with _$Failure {
  const factory Failure.notFound(Object error) = _NotFound;
  const factory Failure.badRequest(Object error) = _BadRequest;
  const factory Failure.unauthorized(Object error) = _Unauthorized;
  const factory Failure.forbidden(Object error) = _Forbidden;
  const factory Failure.conflict(Object error) = _Conflict;
  const factory Failure.serverError(Object error) = _ServerError;
  const factory Failure.serviceUnavailable(Object error) = _ServiceUnavailable;
  const factory Failure.tooManyRequests(Object error) = _TooManyRequests;
  const factory Failure.unknown(Object error) = _Unknown;
  const factory Failure.connectionTimeout(Object error) = _ConnectionTimeout;
  const factory Failure.sendTimeout(Object error) = _SendTimeout;
  const factory Failure.receiveTimeout(Object error) = _ReceiveTimeout;
  const factory Failure.cancel(Object error) = _Cancel;
  const factory Failure.badCertificate(Object error) = _BadCertificate;
  const factory Failure.connectionError(Object error) = _ConnectionError;
  const factory Failure.unprocessableEntity(
      Object error, Map<String, dynamic> validation) = _UnprocessableEntity;

  const Failure._();

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

  static Failure fromException(Object error) {
    Failure handleDioException(DioException error) {
      Failure resolveBadResponse(Response response) {
        return switch (response.statusCode) {
          400 => Failure.badRequest(error),
          401 => Failure.unauthorized(error),
          403 => Failure.forbidden(error),
          404 => Failure.notFound(error),
          409 => Failure.conflict(error),
          500 => Failure.serverError(error),
          503 => Failure.serviceUnavailable(error),
          429 => Failure.tooManyRequests(error),
          422 => Failure.unprocessableEntity(error, response.data),
          _ => Failure.unknown(error),
        };
      }

      return switch (error.type) {
        DioExceptionType.connectionTimeout => Failure.connectionTimeout(error),
        DioExceptionType.sendTimeout => Failure.sendTimeout(error),
        DioExceptionType.receiveTimeout => Failure.receiveTimeout(error),
        DioExceptionType.badResponse => resolveBadResponse(error.response!),
        DioExceptionType.cancel => Failure.cancel(error),
        DioExceptionType.unknown => Failure.unknown(error),
        DioExceptionType.badCertificate => Failure.badCertificate(error),
        DioExceptionType.connectionError => Failure.connectionError(error),
      };
    }

    return switch (error) {
      DioException _ => handleDioException(error),
      _ => Failure.unknown(error),
    };
  }
}
