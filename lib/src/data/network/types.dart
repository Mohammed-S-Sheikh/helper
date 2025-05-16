import 'package:dartz/dartz.dart';
import 'package:helper/src/data/model/model.dart';

typedef EitherResponse<T> = Future<Either<Failure, T>>;

typedef FromJson<T> = T Function(Json json);

typedef Json = Map<String, dynamic>;
