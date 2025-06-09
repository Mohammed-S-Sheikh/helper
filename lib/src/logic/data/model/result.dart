import 'package:helper/src/logic/data/model/model.dart';

class Result<T> {
  Result._({this.data, this.meta, this.failure});

  factory Result.success(T data, {Map<String, dynamic>? meta}) =>
      Result._(data: data, meta: meta);

  factory Result.failure(Failure failure) => Result._(failure: failure);

  final T? data;
  final Map<String, dynamic>? meta;
  final Failure? failure;
}
