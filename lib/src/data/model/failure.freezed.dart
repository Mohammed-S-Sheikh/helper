// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  Object get error => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$NotFoundImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$NotFoundImpl extends _NotFound {
  const _$NotFoundImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.notFound(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      __$$NotFoundImplCopyWithImpl<_$NotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound extends Failure {
  const factory _NotFound(final Object error) = _$NotFoundImpl;
  const _NotFound._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadRequestImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$BadRequestImplCopyWith(
          _$BadRequestImpl value, $Res Function(_$BadRequestImpl) then) =
      __$$BadRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$BadRequestImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BadRequestImpl>
    implements _$$BadRequestImplCopyWith<$Res> {
  __$$BadRequestImplCopyWithImpl(
      _$BadRequestImpl _value, $Res Function(_$BadRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$BadRequestImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$BadRequestImpl extends _BadRequest {
  const _$BadRequestImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.badRequest(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadRequestImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      __$$BadRequestImplCopyWithImpl<_$BadRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class _BadRequest extends Failure {
  const factory _BadRequest(final Object error) = _$BadRequestImpl;
  const _BadRequest._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$UnauthorizedImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$UnauthorizedImpl extends _Unauthorized {
  const _$UnauthorizedImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.unauthorized(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<_$UnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized extends Failure {
  const factory _Unauthorized(final Object error) = _$UnauthorizedImpl;
  const _Unauthorized._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForbiddenImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ForbiddenImplCopyWith(
          _$ForbiddenImpl value, $Res Function(_$ForbiddenImpl) then) =
      __$$ForbiddenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ForbiddenImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ForbiddenImpl>
    implements _$$ForbiddenImplCopyWith<$Res> {
  __$$ForbiddenImplCopyWithImpl(
      _$ForbiddenImpl _value, $Res Function(_$ForbiddenImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ForbiddenImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ForbiddenImpl extends _Forbidden {
  const _$ForbiddenImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.forbidden(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForbiddenImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForbiddenImplCopyWith<_$ForbiddenImpl> get copyWith =>
      __$$ForbiddenImplCopyWithImpl<_$ForbiddenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return forbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return forbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(this);
    }
    return orElse();
  }
}

abstract class _Forbidden extends Failure {
  const factory _Forbidden(final Object error) = _$ForbiddenImpl;
  const _Forbidden._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForbiddenImplCopyWith<_$ForbiddenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConflictImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$ConflictImplCopyWith(
          _$ConflictImpl value, $Res Function(_$ConflictImpl) then) =
      __$$ConflictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ConflictImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ConflictImpl>
    implements _$$ConflictImplCopyWith<$Res> {
  __$$ConflictImplCopyWithImpl(
      _$ConflictImpl _value, $Res Function(_$ConflictImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ConflictImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ConflictImpl extends _Conflict {
  const _$ConflictImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.conflict(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConflictImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConflictImplCopyWith<_$ConflictImpl> get copyWith =>
      __$$ConflictImplCopyWithImpl<_$ConflictImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return conflict?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }
}

abstract class _Conflict extends Failure {
  const factory _Conflict(final Object error) = _$ConflictImpl;
  const _Conflict._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConflictImplCopyWith<_$ConflictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ServerErrorImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl extends _ServerError {
  const _$ServerErrorImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.serverError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError extends Failure {
  const factory _ServerError(final Object error) = _$ServerErrorImpl;
  const _ServerError._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceUnavailableImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServiceUnavailableImplCopyWith(_$ServiceUnavailableImpl value,
          $Res Function(_$ServiceUnavailableImpl) then) =
      __$$ServiceUnavailableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ServiceUnavailableImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServiceUnavailableImpl>
    implements _$$ServiceUnavailableImplCopyWith<$Res> {
  __$$ServiceUnavailableImplCopyWithImpl(_$ServiceUnavailableImpl _value,
      $Res Function(_$ServiceUnavailableImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ServiceUnavailableImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ServiceUnavailableImpl extends _ServiceUnavailable {
  const _$ServiceUnavailableImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.serviceUnavailable(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceUnavailableImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceUnavailableImplCopyWith<_$ServiceUnavailableImpl> get copyWith =>
      __$$ServiceUnavailableImplCopyWithImpl<_$ServiceUnavailableImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return serviceUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return serviceUnavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable(this);
    }
    return orElse();
  }
}

abstract class _ServiceUnavailable extends Failure {
  const factory _ServiceUnavailable(final Object error) =
      _$ServiceUnavailableImpl;
  const _ServiceUnavailable._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceUnavailableImplCopyWith<_$ServiceUnavailableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TooManyRequestsImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$TooManyRequestsImplCopyWith(_$TooManyRequestsImpl value,
          $Res Function(_$TooManyRequestsImpl) then) =
      __$$TooManyRequestsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$TooManyRequestsImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$TooManyRequestsImpl>
    implements _$$TooManyRequestsImplCopyWith<$Res> {
  __$$TooManyRequestsImplCopyWithImpl(
      _$TooManyRequestsImpl _value, $Res Function(_$TooManyRequestsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$TooManyRequestsImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$TooManyRequestsImpl extends _TooManyRequests {
  const _$TooManyRequestsImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.tooManyRequests(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TooManyRequestsImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TooManyRequestsImplCopyWith<_$TooManyRequestsImpl> get copyWith =>
      __$$TooManyRequestsImplCopyWithImpl<_$TooManyRequestsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return tooManyRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return tooManyRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (tooManyRequests != null) {
      return tooManyRequests(this);
    }
    return orElse();
  }
}

abstract class _TooManyRequests extends Failure {
  const factory _TooManyRequests(final Object error) = _$TooManyRequestsImpl;
  const _TooManyRequests._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TooManyRequestsImplCopyWith<_$TooManyRequestsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$UnknownImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$UnknownImpl extends _Unknown {
  const _$UnknownImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.unknown(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown extends Failure {
  const factory _Unknown(final Object error) = _$UnknownImpl;
  const _Unknown._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionTimeoutImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ConnectionTimeoutImplCopyWith(_$ConnectionTimeoutImpl value,
          $Res Function(_$ConnectionTimeoutImpl) then) =
      __$$ConnectionTimeoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ConnectionTimeoutImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ConnectionTimeoutImpl>
    implements _$$ConnectionTimeoutImplCopyWith<$Res> {
  __$$ConnectionTimeoutImplCopyWithImpl(_$ConnectionTimeoutImpl _value,
      $Res Function(_$ConnectionTimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ConnectionTimeoutImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ConnectionTimeoutImpl extends _ConnectionTimeout {
  const _$ConnectionTimeoutImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.connectionTimeout(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionTimeoutImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionTimeoutImplCopyWith<_$ConnectionTimeoutImpl> get copyWith =>
      __$$ConnectionTimeoutImplCopyWithImpl<_$ConnectionTimeoutImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return connectionTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return connectionTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (connectionTimeout != null) {
      return connectionTimeout(this);
    }
    return orElse();
  }
}

abstract class _ConnectionTimeout extends Failure {
  const factory _ConnectionTimeout(final Object error) =
      _$ConnectionTimeoutImpl;
  const _ConnectionTimeout._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionTimeoutImplCopyWith<_$ConnectionTimeoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendTimeoutImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$SendTimeoutImplCopyWith(
          _$SendTimeoutImpl value, $Res Function(_$SendTimeoutImpl) then) =
      __$$SendTimeoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$SendTimeoutImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$SendTimeoutImpl>
    implements _$$SendTimeoutImplCopyWith<$Res> {
  __$$SendTimeoutImplCopyWithImpl(
      _$SendTimeoutImpl _value, $Res Function(_$SendTimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SendTimeoutImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$SendTimeoutImpl extends _SendTimeout {
  const _$SendTimeoutImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.sendTimeout(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendTimeoutImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendTimeoutImplCopyWith<_$SendTimeoutImpl> get copyWith =>
      __$$SendTimeoutImplCopyWithImpl<_$SendTimeoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return sendTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return sendTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (sendTimeout != null) {
      return sendTimeout(this);
    }
    return orElse();
  }
}

abstract class _SendTimeout extends Failure {
  const factory _SendTimeout(final Object error) = _$SendTimeoutImpl;
  const _SendTimeout._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendTimeoutImplCopyWith<_$SendTimeoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveTimeoutImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ReceiveTimeoutImplCopyWith(_$ReceiveTimeoutImpl value,
          $Res Function(_$ReceiveTimeoutImpl) then) =
      __$$ReceiveTimeoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ReceiveTimeoutImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ReceiveTimeoutImpl>
    implements _$$ReceiveTimeoutImplCopyWith<$Res> {
  __$$ReceiveTimeoutImplCopyWithImpl(
      _$ReceiveTimeoutImpl _value, $Res Function(_$ReceiveTimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ReceiveTimeoutImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ReceiveTimeoutImpl extends _ReceiveTimeout {
  const _$ReceiveTimeoutImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.receiveTimeout(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveTimeoutImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveTimeoutImplCopyWith<_$ReceiveTimeoutImpl> get copyWith =>
      __$$ReceiveTimeoutImplCopyWithImpl<_$ReceiveTimeoutImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return receiveTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return receiveTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (receiveTimeout != null) {
      return receiveTimeout(this);
    }
    return orElse();
  }
}

abstract class _ReceiveTimeout extends Failure {
  const factory _ReceiveTimeout(final Object error) = _$ReceiveTimeoutImpl;
  const _ReceiveTimeout._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveTimeoutImplCopyWith<_$ReceiveTimeoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$CancelImplCopyWith(
          _$CancelImpl value, $Res Function(_$CancelImpl) then) =
      __$$CancelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$CancelImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CancelImpl>
    implements _$$CancelImplCopyWith<$Res> {
  __$$CancelImplCopyWithImpl(
      _$CancelImpl _value, $Res Function(_$CancelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CancelImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$CancelImpl extends _Cancel {
  const _$CancelImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.cancel(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelImplCopyWith<_$CancelImpl> get copyWith =>
      __$$CancelImplCopyWithImpl<_$CancelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class _Cancel extends Failure {
  const factory _Cancel(final Object error) = _$CancelImpl;
  const _Cancel._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelImplCopyWith<_$CancelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadCertificateImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$BadCertificateImplCopyWith(_$BadCertificateImpl value,
          $Res Function(_$BadCertificateImpl) then) =
      __$$BadCertificateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$BadCertificateImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BadCertificateImpl>
    implements _$$BadCertificateImplCopyWith<$Res> {
  __$$BadCertificateImplCopyWithImpl(
      _$BadCertificateImpl _value, $Res Function(_$BadCertificateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$BadCertificateImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$BadCertificateImpl extends _BadCertificate {
  const _$BadCertificateImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.badCertificate(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadCertificateImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadCertificateImplCopyWith<_$BadCertificateImpl> get copyWith =>
      __$$BadCertificateImplCopyWithImpl<_$BadCertificateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return badCertificate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return badCertificate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (badCertificate != null) {
      return badCertificate(this);
    }
    return orElse();
  }
}

abstract class _BadCertificate extends Failure {
  const factory _BadCertificate(final Object error) = _$BadCertificateImpl;
  const _BadCertificate._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadCertificateImplCopyWith<_$BadCertificateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ConnectionErrorImplCopyWith(_$ConnectionErrorImpl value,
          $Res Function(_$ConnectionErrorImpl) then) =
      __$$ConnectionErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ConnectionErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ConnectionErrorImpl>
    implements _$$ConnectionErrorImplCopyWith<$Res> {
  __$$ConnectionErrorImplCopyWithImpl(
      _$ConnectionErrorImpl _value, $Res Function(_$ConnectionErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ConnectionErrorImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ConnectionErrorImpl extends _ConnectionError {
  const _$ConnectionErrorImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.connectionError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionErrorImplCopyWith<_$ConnectionErrorImpl> get copyWith =>
      __$$ConnectionErrorImplCopyWithImpl<_$ConnectionErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return connectionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return connectionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(this);
    }
    return orElse();
  }
}

abstract class _ConnectionError extends Failure {
  const factory _ConnectionError(final Object error) = _$ConnectionErrorImpl;
  const _ConnectionError._() : super._();

  @override
  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionErrorImplCopyWith<_$ConnectionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnprocessableEntityImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnprocessableEntityImplCopyWith(_$UnprocessableEntityImpl value,
          $Res Function(_$UnprocessableEntityImpl) then) =
      __$$UnprocessableEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error, Map<String, dynamic> validation});
}

/// @nodoc
class __$$UnprocessableEntityImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnprocessableEntityImpl>
    implements _$$UnprocessableEntityImplCopyWith<$Res> {
  __$$UnprocessableEntityImplCopyWithImpl(_$UnprocessableEntityImpl _value,
      $Res Function(_$UnprocessableEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? validation = null,
  }) {
    return _then(_$UnprocessableEntityImpl(
      null == error ? _value.error : error,
      null == validation
          ? _value._validation
          : validation // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UnprocessableEntityImpl extends _UnprocessableEntity {
  const _$UnprocessableEntityImpl(
      this.error, final Map<String, dynamic> validation)
      : _validation = validation,
        super._();

  @override
  final Object error;
  final Map<String, dynamic> _validation;
  @override
  Map<String, dynamic> get validation {
    if (_validation is EqualUnmodifiableMapView) return _validation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_validation);
  }

  @override
  String toString() {
    return 'Failure.unprocessableEntity(error: $error, validation: $validation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnprocessableEntityImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other._validation, _validation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(_validation));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnprocessableEntityImplCopyWith<_$UnprocessableEntityImpl> get copyWith =>
      __$$UnprocessableEntityImplCopyWithImpl<_$UnprocessableEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ConnectionTimeout value) connectionTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_BadCertificate value) badCertificate,
    required TResult Function(_ConnectionError value) connectionError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
  }) {
    return unprocessableEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Conflict value)? conflict,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ConnectionTimeout value)? connectionTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_BadCertificate value)? badCertificate,
    TResult? Function(_ConnectionError value)? connectionError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
  }) {
    return unprocessableEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ConnectionTimeout value)? connectionTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_BadCertificate value)? badCertificate,
    TResult Function(_ConnectionError value)? connectionError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    required TResult orElse(),
  }) {
    if (unprocessableEntity != null) {
      return unprocessableEntity(this);
    }
    return orElse();
  }
}

abstract class _UnprocessableEntity extends Failure {
  const factory _UnprocessableEntity(
          final Object error, final Map<String, dynamic> validation) =
      _$UnprocessableEntityImpl;
  const _UnprocessableEntity._() : super._();

  @override
  Object get error;
  Map<String, dynamic> get validation;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnprocessableEntityImplCopyWith<_$UnprocessableEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
