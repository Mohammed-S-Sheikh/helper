import 'package:helper/src/logic/data/model/model.dart';

class Result<DataT> {
  Result._({this.data, this.meta, this.failure, required this.isSuccess});

  factory Result.success(DataT data, {Map<String, dynamic>? meta}) =>
      Result._(data: data, meta: meta, isSuccess: true);

  factory Result.failure(Failure failure) =>
      Result._(failure: failure, isSuccess: false);

  final bool isSuccess;

  final DataT? data;
  final Map<String, dynamic>? meta;
  final Failure? failure;
}
