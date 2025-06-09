import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:helper/src/l10n/helper_localizations.dart';

typedef ValidationFailureType = Map<String, List<String>>;

abstract interface class Failure {
  const Failure._();

  const factory Failure.auth() = _AuthFailure;

  const factory Failure.badRequest() = _BadRequestFailure;

  const factory Failure.conflict() = _ConflictFailure;

  const factory Failure.forbidden() = _ForbiddenFailure;

  const factory Failure.internal() = _InternalFailure;

  const factory Failure.network() = _NetworkFailure;

  const factory Failure.notFound() = _NotFoundFailure;

  const factory Failure.payment() = _PaymentRequiredFailure;

  const factory Failure.server() = _ServerFailure;

  const factory Failure.serviceUnavailable() = _ServiceUnavailableFailure;

  const factory Failure.tooManyRequests() = _TooManyRequestsFailure;

  const factory Failure.unauthorized() = _UnauthorizedFailure;

  const factory Failure.validation(ValidationFailureType errors) =
      _ValidationFailure;

  ValidationFailureType? get validation {
    if (this is _ValidationFailure) {
      return (this as _ValidationFailure).errors;
    }

    return null;
  }

  String message(BuildContext context) {
    final localizations = HelperLocalizations.of(context)!;
    return _getMessage(localizations);
  }

  String _getMessage(HelperLocalizations localizations);

  static Failure fromException(Object exception) {
    if (exception is! DioException) {
      return Failure.internal();
    }

    Failure resolveBadResponse(Response response) {
      late final errors = Map<String, List<String>>.from(
        response.data['errors'].map(
          (key, value) => MapEntry(key, List<String>.from(value)),
        ),
      );

      return switch (response.statusCode) {
        400 => Failure.badRequest(),
        401 => Failure.unauthorized(),
        402 => Failure.payment(),
        403 => Failure.forbidden(),
        404 => Failure.notFound(),
        409 => Failure.conflict(),
        422 => Failure.validation(errors),
        429 => Failure.tooManyRequests(),
        500 => Failure.server(),
        503 => Failure.serviceUnavailable(),
        _ => Failure.internal(),
      };
    }

    return switch (exception.type) {
      DioExceptionType.badCertificate => Failure.network(),
      DioExceptionType.badResponse => resolveBadResponse(exception.response!),
      DioExceptionType.connectionError => Failure.network(),
      DioExceptionType.connectionTimeout => Failure.network(),
      DioExceptionType.receiveTimeout => Failure.network(),
      DioExceptionType.sendTimeout => Failure.network(),
      _ => Failure.internal(),
    };
  }
}

class _AuthFailure extends Failure {
  const _AuthFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.authError;
  }
}

class _BadRequestFailure extends Failure {
  const _BadRequestFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.badRequest;
  }
}

class _ConflictFailure extends Failure {
  const _ConflictFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.validationError;
  }
}

class _ForbiddenFailure extends Failure {
  const _ForbiddenFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.forbidden;
  }
}

class _InternalFailure extends Failure {
  const _InternalFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.internalError;
  }
}

class _NetworkFailure extends Failure {
  const _NetworkFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.networkError;
  }
}

class _NotFoundFailure extends Failure {
  const _NotFoundFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.notFound;
  }
}

class _PaymentRequiredFailure extends Failure {
  const _PaymentRequiredFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.paymentError;
  }
}

class _ServerFailure extends Failure {
  const _ServerFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.serverError;
  }
}

class _ServiceUnavailableFailure extends Failure {
  const _ServiceUnavailableFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.serviceUnavailable;
  }
}

class _TooManyRequestsFailure extends Failure {
  const _TooManyRequestsFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.tooManyRequests;
  }
}

class _UnauthorizedFailure extends Failure {
  const _UnauthorizedFailure() : super._();

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.unauthorized;
  }
}

class _ValidationFailure extends Failure {
  const _ValidationFailure(this.errors) : super._();

  final ValidationFailureType errors;

  @override
  String _getMessage(HelperLocalizations localizations) {
    return localizations.validationError;
  }
}
