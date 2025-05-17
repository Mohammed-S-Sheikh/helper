import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class ApiResponse<T> {
  final String? message;
  final T? data;
  final PaginationMeta? meta;

  const ApiResponse({
    this.message,
    this.data,
    this.meta,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

@JsonSerializable(createToJson: false)
class PaginationMeta<T> {
  const PaginationMeta({
    required this.page,
    required this.lastPage,
  });

  @JsonKey(name: 'current_page')
  final int page;
  @JsonKey(name: 'last_page')
  final int lastPage;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);

  bool get hasMore => page < lastPage;
}
