import 'package:helper/src/data/model/failure.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class ApiResponse<T> {
  final String status;
  final String message;
  final T? data;
  @JsonKey(fromJson: _fromJson)
  final ResponseFailure? failure;
  @JsonKey(name: 'meta')
  final PaginationMeta? paginationMeta;

  const ApiResponse({
    required this.status,
    required this.message,
    this.data,
    this.failure,
    this.paginationMeta,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  static ResponseFailure? _fromJson(Object? json) => null;

  bool get isSuccess => status == 'success';
}

@JsonSerializable(createToJson: false)
class PaginationMeta<T> {
  const PaginationMeta({
    required this.page,
    required this.lastPage,
  });

  final int page;
  final int lastPage;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);

  bool get hasMore => page < lastPage;
}
