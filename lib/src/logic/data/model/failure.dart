import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:helper/src/l10n/helper_localizations.dart';

typedef ValidationFailureType = Map<String, List<String>>;

abstract interface class Failure {
  const Failure._([this._message]);

  const factory Failure.auth([String? message]) = _AuthFailure;

  const factory Failure.badRequest([String? message]) = _BadRequestFailure;

  const factory Failure.conflict([String? message]) = _ConflictFailure;

  const factory Failure.forbidden([String? message]) = _ForbiddenFailure;

  const factory Failure.internal([String? message]) = _InternalFailure;

  const factory Failure.network([String? message]) = _NetworkFailure;

  const factory Failure.notFound([String? message]) = _NotFoundFailure;

  const factory Failure.payment([String? message]) = _PaymentRequiredFailure;

  const factory Failure.server([String? message]) = _ServerFailure;

  const factory Failure.serviceUnavailable([String? message]) =
      _ServiceUnavailableFailure;

  const factory Failure.tooManyRequests([String? message]) =
      _TooManyRequestsFailure;

  const factory Failure.unauthorized([String? message]) = _UnauthorizedFailure;

  const factory Failure.validation(ValidationFailureType errors,
      [String? message]) = _ValidationFailure;

  ValidationFailureType? get validation {
    if (this is _ValidationFailure) {
      return (this as _ValidationFailure).errors;
    }

    return null;
  }

  final String? _message;

  String message(BuildContext context) {
    if (_message != null) return _message;

    final localizations = HelperLocalizations.of(context)!;
    return _getMessage(localizations);
  }

  String _getMessage(HelperLocalizations localizations);

  static Failure fromException(Object exception) {
    if (exception is! DioException) {
      return Failure.internal();
    }

    Failure resolveBadResponse(Response response) {
      late final errors = response.data['errors'] == null
          ? null
          : Map<String, List<String>>.from(
              response.data['errors'].map(
                (key, value) => MapEntry(key, List<String>.from(value)),
              ),
            );

      final String? message = response.data['message'];

      return switch (response.statusCode) {
        400 => Failure.badRequest(message),
        401 => Failure.unauthorized(message),
        402 => Failure.payment(message),
        403 => Failure.forbidden(message),
        404 => Failure.notFound(message),
        409 => Failure.conflict(message),
        422 => Failure.validation(errors ?? {}, message),
        429 => Failure.tooManyRequests(message),
        500 => Failure.server(message),
        503 => Failure.serviceUnavailable(message),
        _ => Failure.internal(message),
      };
    }

    return switch (exception.type) {
      DioExceptionType.badCertificate => Failure.network(),
      DioExceptionType.badResponse => resolveBadResponse(exception.response!),
      DioExceptionType.connectionError => Failure.network(),
      DioExceptionType.connectionTimeout => Failure.network(),
      DioExceptionType.receiveTimeout => Failure.network(),
      DioExceptionType.sendTimeout => Failure.network(),
      _ => Failure.internal(exception.message),
    };
  }
}

class _AuthFailure extends Failure {
  const _AuthFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.authError;
  }
}

class _BadRequestFailure extends Failure {
  const _BadRequestFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.badRequest;
  }
}

class _ConflictFailure extends Failure {
  const _ConflictFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.validationError;
  }
}

class _ForbiddenFailure extends Failure {
  const _ForbiddenFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.forbidden;
  }
}

class _InternalFailure extends Failure {
  const _InternalFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.internalError;
  }
}

class _NetworkFailure extends Failure {
  const _NetworkFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.networkError;
  }
}

class _NotFoundFailure extends Failure {
  const _NotFoundFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.notFound;
  }
}

class _PaymentRequiredFailure extends Failure {
  const _PaymentRequiredFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.paymentError;
  }
}

class _ServerFailure extends Failure {
  const _ServerFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.serverError;
  }
}

class _ServiceUnavailableFailure extends Failure {
  const _ServiceUnavailableFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.serviceUnavailable;
  }
}

class _TooManyRequestsFailure extends Failure {
  const _TooManyRequestsFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.tooManyRequests;
  }
}

class _UnauthorizedFailure extends Failure {
  const _UnauthorizedFailure([super._message]) : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.unauthorized;
  }
}

class _ValidationFailure extends Failure {
  const _ValidationFailure(this.errors, [super._message]) : super._();

  final ValidationFailureType errors;

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.validationError;
  }
}
