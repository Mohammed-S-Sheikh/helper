// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      meta: json['meta'] == null
          ? null
          : PaginationMeta<dynamic>.fromJson(
              json['meta'] as Map<String, dynamic>),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

PaginationMeta<T> _$PaginationMetaFromJson<T>(Map<String, dynamic> json) =>
    PaginationMeta<T>(
      page: (json['current_page'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
    );
